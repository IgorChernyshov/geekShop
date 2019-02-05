//
//  ErrorParser.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This class parses errors that can raise during network requests.
 It handles errors that didn't reach the server as well as
 error codes that were returned as a response from the server.
 */

enum AppError: Error {
  // Server returns an authentication error
  case authenticationError
  // Client has canceled a request
  case canceledRequest
  // The request didn't reach the server
  case clientError
  // Server didn't return an error but the response has no data
  case serverError
  // This error is not specified. It will be reported to developers
  case unknownError
}

protocol ErrorParser {
  // This method parses errors that did not reach the server
  func parse(_ result: Error) -> AppError
  // This method parses errors that were received from the server
  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult
}

class ErrorParserImplementation: ErrorParser {
  
  func parse(_ result: Error) -> AppError {
    let error = result as NSError
    switch error.code {
    case -999:
      return .canceledRequest
    case -1001, -1005, -1009:
      return .clientError
    default:
      return .unknownError
    }
  }
  
  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult {
    switch response.statusCode {
    case 200..<300:
      // This status code means success. Yet still need to check if we have received some data
      if data == nil {
        // TODO: Show alert to user "Looks like something is broken on our side. Please, try again later"
        return .failure(AppError.serverError)
      } else {
        // TODO: Request was successful, data has been received. Continue application execution
        return .success
      }
    case 401, 403:
      // TODO: Request was unsuccessful due to authentication. Try to re-obtain token or re-login user
      return .failure(AppError.authenticationError)
    default:
      // TODO: Unhandled error. Send an error code to developers to create a handler
      return .failure(AppError.unknownError)
    }
  }
  
}

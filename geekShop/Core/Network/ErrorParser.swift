//
//  ErrorParser.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

enum AppError: Error {
  case authenticationError
  case clientError
  case serverError
  case unknownError
}

protocol ErrorParser {
  func parse(_ result: Error) -> Error
  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult
}

class ErrorParserImplementation: ErrorParser {
  
  func parse(_ result: Error) -> Error {
    return result
  }
  
  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult {
    if data == nil {
      // TODO: Show Alert to user "Looks like something is broken on our side. Please, try again later"
      return .failure(AppError.serverError)
    }
    switch response.statusCode {
    case 200..<300:
      // Request was successful, data has been received. Continue application execution
      return .success
    case 300..<400, 500...530:
      // TODO: Show Alert to user "Looks like something is broken on our side. Please, try again later"
      return .failure(AppError.serverError)
    case 401, 403:
      // TODO: Request was unsuccessful due to authentication. Try to re-obtain token or re-login user
      return .failure(AppError.authenticationError)
    case 400..<500:
      // TODO: Show Alert to user "Cannot connect. Please check your Internet connection and try again"
      return .failure(AppError.clientError)
    default:
      // TODO: Unhandled error. Send an error code to developers to create a handler
      return .failure(AppError.unknownError)
    }
  }
  
}

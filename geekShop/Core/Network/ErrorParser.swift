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
  case serverError
}

protocol ErrorParser {
  func parse(_ result: Error) -> Error
  func parse(_ request: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult
}

class ErrorParserImplementation: ErrorParser {
  
  func parse(_ result: Error) -> Error {
    return result
  }
  
  func parse(_ reauest: URLRequest?, _ response: HTTPURLResponse, _ data: Data?) -> Request.ValidationResult {
    if !(200..<300).contains(response.statusCode) {
      return .failure(AppError.serverError)
    } else if data == nil {
      return .failure(AppError.serverError)
    } else {
      return .success
    }
  }
  
}

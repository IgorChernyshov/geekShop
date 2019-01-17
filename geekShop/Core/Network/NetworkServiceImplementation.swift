//
//  NetworkServiceImplementation.swift
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

class NetworkServiceImplementation: NetworkService {
  
  let errorParser: ErrorParser
  let sessionManager: SessionManager
  
  // Dependency Injection - Initializer Injection
  init(
    errorParser: ErrorParser,
    sessionManager: SessionManager) {
    
    self.errorParser = errorParser
    self.sessionManager = sessionManager
  }
  
  func request<T: Decodable>(
    _ request: URLRequestConvertible,
    completionHandler: @escaping (T?) -> Void) {
    
    sessionManager
      .request(request)
      .validate(errorParser.parse).responseData { resрonse in
        do {
          let value = try JSONDecoder().decode(T.self, from: resрonse.result.value!)
          completionHandler(value)
        } catch {
          print(error)
          completionHandler(nil)
        }
    }
  }
}

//
//  AbstractRequestFactory.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

protocol AbstractRequestFactory {
  var errorParser: AbstractErrorParser { get }
  var sessionManager: SessionManager { get }
  var queue: DispatchQueue? { get }
  
  @discardableResult
  func request<T: Decodable>(
    request: URLRequestConvertible,
    completionHandler: @escaping (DataResponse<T>) -> Void)
    -> DataRequest
}

extension AbstractRequestFactory {
  
  @discardableResult
  public func request<T: Decodable>(
    request: URLRequestConvertible,
    completionHandler: @escaping (DataResponse<T>) -> Void)
    -> DataRequest {
      return sessionManager
        .request(request)
        .responseCodable(errorParser: errorParser, queue: queue, completionHandler: completionHandler)
  }
}


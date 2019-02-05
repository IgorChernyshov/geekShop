//
//  RequestRouter.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This protocol helps to build Alamofire's requests from *Request structures.
 */

enum RequestRouterEncoding {
  case url, json
}

protocol RequestRouter: URLRequestConvertible {
  
  var baseURL: URL { get }
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
  var fullURL: URL { get }
  var encoding: RequestRouterEncoding { get }
  
}

extension RequestRouter {
  
  var fullURL: URL {
    return baseURL.appendingPathComponent(path)
  }
  
  var encoding: RequestRouterEncoding {
    return .url
  }
  
  func asURLRequest() throws -> URLRequest {
    var urlRequest = URLRequest(url: fullURL)
    urlRequest.httpMethod = method.rawValue
    
    switch self.encoding {
    case .url:
      return try URLEncoding.default.encode(urlRequest, with: parameters)
    case .json:
      return try JSONEncoding.default.encode(urlRequest, with: parameters)
    }
  }
  
}

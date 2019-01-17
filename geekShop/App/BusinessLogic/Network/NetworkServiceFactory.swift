//
//  NetworkServiceFactory.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkServiceFactory {
  
  let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses")!
  
  func makeErrorParser() -> ErrorParser {
    return ErrorParserImplementation()
  }
  
  lazy var commonSessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = false
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    let manager = SessionManager(configuration: configuration)
    return manager
  }()
  
  func makeNetworkService() -> NetworkService {
    return NetworkServiceImplementation(
      errorParser: makeErrorParser(),
      sessionManager: commonSessionManager
    )
  }
  
  func makeAuthService() -> AuthService {
    return AuthServiceImplementation(baseURL: baseUrl, networkService: makeNetworkService())
  }
}

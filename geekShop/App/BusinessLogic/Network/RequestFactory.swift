//
//  RequestFactory.swift
//  geekShop
//
//  Created by Igor Chernyshov on 16/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

class RequestFactory {
  func makeErrorParser() -> AbstractErrorParser {
    return ErrorParser()
  }
  
  lazy var commonSessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = false
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    let manager = SessionManager(configuration: configuration)
    return manager
  }()
  
  let sessionQueue = DispatchQueue.global(qos: .utility)
  
  func makeAuthRequestFatory() -> AuthRequestFactory {
    let errorParser = makeErrorParser()
    return Auth(errorParser: errorParser, sessionManager: commonSessionManager, queue: sessionQueue)
  }
}

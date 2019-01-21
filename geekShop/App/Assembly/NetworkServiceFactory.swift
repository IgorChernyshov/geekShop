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
  
  private let configuration = Configuration()
  private let errorParser = ErrorParserImplementation()
  
  private(set) lazy var commonSessionManager: SessionManager = {
    let configuration = URLSessionConfiguration.default
    configuration.httpShouldSetCookies = false
    configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
    let manager = SessionManager(configuration: configuration)
    return manager
  }()
  
  private(set) lazy var networkService = NetworkServiceImplementation(
    errorParser: errorParser,
    sessionManager: commonSessionManager
  )
  
  // MARK: - User Account Services
  func makeAuthService() -> AuthService {
    return AuthServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
  
  func makeRegisterService() -> RegisterService {
    return RegisterServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
  
  func makeLogoutService() -> LogoutService {
    return LogoutServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
  
  func makeChangeUserDataService() -> ChangeUserProfileService {
    return ChangeUserDataServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
  
  // MARK: - Review Services
  func makeAddReviewService() -> AddReviewService {
    return AddReviewServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
  
  func makeApproveReviewService() -> ApproveReviewService {
    return ApproveReviewServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
  
  func makeRemoveReviewService() -> RemoveReviewService {
    return RemoveReviewServiceImplementation(baseURL: configuration.baseUrl, networkService: networkService)
  }
}

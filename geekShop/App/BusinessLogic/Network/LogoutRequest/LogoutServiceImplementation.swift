//
//  LogoutServiceImplementation.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

// Class implements RegisterService protocol
class LogoutServiceImplementation: LogoutService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  // Dependency Injection - Initializer Injection
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func logout(userID: Int, completion: @escaping (LogoutResponse?) -> Void) {
    let request = LogoutRequest(baseURL: baseURL, userID: userID)
    networkService.request(request) { (response: LogoutResponse?) in
      completion(response)
    }
  }
}

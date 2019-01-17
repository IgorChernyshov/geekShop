//
//  AuthServiceImplementation.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

// Class implements AuthService protocol
class AuthServiceImplementation: AuthService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  // Dependency Injection - Initializer Injection
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func login(login: String, password: String, completion: @escaping (User?) -> Void) {
    let request = LoginRequest(baseURL: baseURL, login: login, password: password)
    networkService.request(request) { (response: LoginResponse?) in
      completion(response?.user)
    }
  }
}

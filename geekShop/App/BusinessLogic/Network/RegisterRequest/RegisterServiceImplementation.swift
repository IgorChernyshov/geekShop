//
//  RegisterServiceImplementation.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

// Class implements RegisterService protocol
class RegisterServiceImplementation: RegisterService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  // Dependency Injection - Initializer Injection
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func register(login: String, password: String, email: String, completion: @escaping (RegisterResponse?) -> Void) {
    let request = RegisterRequest(baseURL: baseURL, login: login, password: password, email: email)
    networkService.request(request) { (response: RegisterResponse?) in
      completion(response)
    }
  }
}

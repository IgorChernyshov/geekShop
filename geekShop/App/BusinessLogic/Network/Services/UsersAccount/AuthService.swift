//
//  AuthService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to log in a user.
 Completion handler returns server's response as a JSON.
 */

protocol AuthService {
  func login(login: String, password: String, cookie: String, completion: @escaping (User?) -> Void)
}

class AuthServiceImplementation: AuthService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func login(login: String, password: String, cookie: String, completion: @escaping (User?) -> Void) {
    let request = LoginRequest(baseURL: baseURL, login: login, password: password, cookie: cookie)
    networkService.request(request) { (response: LoginResponse?) in
      completion(response?.user)
    }
  }
  
}

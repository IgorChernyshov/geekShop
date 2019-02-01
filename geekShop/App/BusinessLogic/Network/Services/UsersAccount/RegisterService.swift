//
//  RegisterService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol RegisterService {
  func register(data: UserProfileData, completion: @escaping (RegisterResponse?) -> Void)
}

class RegisterServiceImplementation: RegisterService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func register(data: UserProfileData, completion: @escaping (RegisterResponse?) -> Void) {
    let request = RegisterRequest(baseURL: baseURL, data: data)
    networkService.request(request) { (response: RegisterResponse?) in
      completion(response)
    }
  }
  
}

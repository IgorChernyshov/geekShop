//
//  RegisterService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to register new user.
 Completion handler returns server's response as a JSON.
 */

protocol RegisterService {
  /// A service to send a request to the server to log out user.
  ///
  /// - Parameters:
  ///   - data: new user's data. userID, username, password and email are mandatory parameters.
  ///           Other parameters are optional.
  ///   - completion: a JSON response from the server which shows whether request was successfull or not
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

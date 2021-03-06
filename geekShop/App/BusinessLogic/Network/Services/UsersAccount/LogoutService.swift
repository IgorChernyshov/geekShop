//
//  LogoutService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to log out a user.
 Completion handler returns server's response as a JSON.
 */

protocol LogoutService {
  
  /// A service to send a request to the server to log out user.
  ///
  /// - Parameters:
  ///   - userID: an ID of user to log out
  ///   - completion: a JSON response from the server which shows whether the request was successfull or not
  func logout(userID: Int, completion: @escaping (LogoutResponse?) -> Void)
  
}

class LogoutServiceImplementation: LogoutService {
  
  let baseURL: URL
  let networkService: NetworkService
  
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

//
//  ChangeUserDataService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol ChangeUserDataService {
  func changeUserData(
    userID: Int,
    login: String,
    password: String,
    email: String,
    gender: String,
    creditCardNumber: String,
    bio: String,
    completion: @escaping (ChangeUserDataResponse?) -> Void)
}

class ChangeUserDataServiceImplementation: ChangeUserDataService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func changeUserData(
    userID: Int,
    login: String,
    password: String,
    email: String,
    gender: String,
    creditCardNumber: String,
    bio: String,
    completion: @escaping (ChangeUserDataResponse?) -> Void) {
    let request = ChangeUserDataRequest(
      baseURL: baseURL,
      userID: userID,
      login: login,
      password: password,
      email: email,
      gender: gender,
      creditCardNumber: creditCardNumber,
      bio: bio)
    networkService.request(request) { (response: ChangeUserDataResponse?) in
      completion(response)
    }
  }
  
}

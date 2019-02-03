//
//  ChangeUserDataService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to change user's profile data.
 Completion handler returns server's response as a JSON.
 */

protocol ChangeUserProfileService {
  func changeUserProfile(
    data: UserProfileData,
    completion: @escaping (ChangeUserProfileResponse?) -> Void)
}

class ChangeUserDataServiceImplementation: ChangeUserProfileService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func changeUserProfile(
    data: UserProfileData,
    completion: @escaping (ChangeUserProfileResponse?) -> Void) {
    let request = ChangeUserProfileRequest(
      baseURL: baseURL,
      data: data)
    networkService.request(request) { (response: ChangeUserProfileResponse?) in
      completion(response)
    }
  }
  
}

//
//  ChangeUserDataService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

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

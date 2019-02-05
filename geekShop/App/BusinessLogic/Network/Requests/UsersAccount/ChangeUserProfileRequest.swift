//
//  ChangeUserProfileDataRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to change user's profile data.
 */

struct ChangeUserProfileRequest: RequestRouter {
  
  let baseURL: URL
  let data: UserProfileData
  
  let method: HTTPMethod = .post
  let path: String = "changeUserProfile"
  var parameters: Parameters? {
    return [
      "id_user": data.userID,
      "username": data.login,
      "password": data.password,
      "email": data.email,
      "gender": data.gender,
      "credit_card": data.creditCardNumber,
      "bio": data.bio
    ]
  }
  
}

//
//  ChangeUserProfileDataRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

struct ChangeUserProfileRequest: RequestRouter {
  let baseURL: URL
  let data: UserProfileData
  
  let method: HTTPMethod = .get
  let path: String = "changeUserData.json"
  var parameters: Parameters? {
    return [
      "userID": data.userID,
      "login": data.login,
      "password": data.password,
      "email": data.email,
      "gender": data.gender,
      "credit_card": data.creditCardNumber,
      "bio": data.bio
    ]
  }
}

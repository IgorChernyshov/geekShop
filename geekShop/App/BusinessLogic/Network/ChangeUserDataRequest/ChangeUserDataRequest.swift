//
//  ChangeUserDataRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

struct ChangeUserDataRequest: RequestRouter {
  let baseURL: URL
  let userID: Int
  let login: String
  let password: String
  let email: String
  let gender: String
  let creditCardNumber: String
  let bio: String
  
  let method: HTTPMethod = .get
  let path: String = "changeUserData.json"
  var parameters: Parameters? {
    return [
      "userID": userID,
      "login": login,
      "password": password,
      "email": email,
      "gender": gender,
      "credit_card": creditCardNumber,
      "bio": bio
    ]
  }
}

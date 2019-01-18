//
//  LoginRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

struct LoginRequest: RequestRouter {
  let baseURL: URL
  let login: String
  let password: String
  
  let method: HTTPMethod = .get
  let path: String = "login.json"
  var parameters: Parameters? {
    return [
      "username": login,
      "password": password
    ]
  }
}

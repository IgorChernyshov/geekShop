//
//  LoginRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to log in a user.
 */

struct LoginRequest: RequestRouter {
  let baseURL: URL
  let login: String
  let password: String
  let cookie: String
  
  let method: HTTPMethod = .post
  let path: String = "login"
  var parameters: Parameters? {
    return [
      "username": login,
      "password": password,
      "cookie": cookie
    ]
  }
}

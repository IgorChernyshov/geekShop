//
//  LogoutRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to log out a user.
 */

struct LogoutRequest: RequestRouter {
  let baseURL: URL
  let userID: Int
  
  let method: HTTPMethod = .post
  let path: String = "logout"
  var parameters: Parameters? {
    return [
      "id_user": userID
    ]
  }
}

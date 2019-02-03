//
//  User.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for LoginRequest.
 */

struct User: Codable {
  
  let id: Int
  let login: String
  let name: String
  let lastname: String
  
  enum CodingKeys: String, CodingKey {
    case id = "id_user"
    case login = "user_login"
    case name = "user_name"
    case lastname = "user_lastname"
  }
  
}

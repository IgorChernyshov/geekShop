//
//  LoginResponse.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for LoginRequest.
 */

struct LoginResponse: Codable {
  let result: Int
  let user: User
}

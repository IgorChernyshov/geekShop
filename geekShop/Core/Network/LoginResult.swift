//
//  LoginResult.swift
//  geekShop
//
//  Created by Igor Chernyshov on 16/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

struct LoginResult: Codable {
  let result: Int
  let user: User
}

//
//  LogoutResponse.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for LogoutRequest.
 */

struct LogoutResponse: Codable {
  let result: Int
}

//
//  AuthService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol AuthService {
  // Class that implement this protocol must have this method implementation
  func login(login: String, password: String, completion: @escaping (User?) -> Void)
}

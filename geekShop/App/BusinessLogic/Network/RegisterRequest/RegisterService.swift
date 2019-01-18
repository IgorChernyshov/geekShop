//
//  RegisterService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol RegisterService {
  // Class that implements this protocol must have this method implemented
  func register(login: String, password: String, email: String, completion: @escaping (RegisterResponse?) -> Void)
}

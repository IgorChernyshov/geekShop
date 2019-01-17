//
//  ChangeUserDataService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol ChangeUserDataService {
  // Class that implements this protocol must have this method implemented
  func changeUserData(
    userID: Int,
    login: String,
    password: String,
    email: String,
    gender: String,
    creditCardNumber: String,
    bio: String,
    completion: @escaping (ChangeUserDataResponse?) -> Void)
}

//
//  UserProfileData.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that contains user's data to call RegisterService.register method to register users
 and ChangeUserProfileService.changeUserProfile method.
 */

struct UserProfileData {
  let userID: Int
  let login: String
  let password: String
  let email: String
  let gender: String
  let creditCardNumber: String
  let bio: String
}

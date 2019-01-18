//
//  LogoutService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol LogoutService {
  // Class that implements this protocol must have this method implemented
  func logout(userID: Int, completion: @escaping (LogoutResponse?) -> Void)
}

//
//  AuthRequestFactory.swift
//  geekShop
//
//  Created by Igor Chernyshov on 16/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
  func login(userName: String, password: String, completionHandler: @escaping (DataResponse<LoginResult>) -> Void)
}

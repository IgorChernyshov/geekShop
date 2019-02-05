//
//  GetUsersBasketRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to get a list of items.
 */

struct GetUsersBasketRequest: RequestRouter {
  
  let baseURL: URL
  let userID: Int
  
  let method: HTTPMethod = .post
  let path: String = "getUsersBasket"
  var parameters: Parameters? {
    return [
      "id_user": userID
    ]
  }
  
}

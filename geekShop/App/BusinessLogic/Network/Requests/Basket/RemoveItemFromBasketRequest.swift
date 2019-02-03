//
//  RemoveItemFromBasket.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to remove an item from the basket.
 */

struct RemoveItemFromBasketRequest: RequestRouter {
  
  let baseURL: URL
  let productID: Int
  
  let method: HTTPMethod = .post
  let path: String = "removeFromBasket"
  var parameters: Parameters? {
    return [
      "id_product": productID
    ]
  }

}

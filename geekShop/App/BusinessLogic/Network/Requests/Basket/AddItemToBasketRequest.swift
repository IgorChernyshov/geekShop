
//
//  AddItemToBasketRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to add an item to the basket.
 */

struct AddItemToBasketRequest: RequestRouter {
  let baseURL: URL
  let productID: Int
  let quantity: Int
  
  let method: HTTPMethod = .post
  let path: String = "addToBasket"
  var parameters: Parameters? {
    return [
      "id_product": productID,
      "quantity": quantity
    ]
  }
}

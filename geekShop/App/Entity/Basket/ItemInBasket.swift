//
//  ItemInBasket.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for GetUsersBasketRequest.
 */

struct ItemInBasket: Codable {
  
  let productID: Int
  let productName: String
  let price: Int
  let quantity: Int
  
}

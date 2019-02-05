//
//  GetUsersBasketResponse.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for GetUsersBasketRequest.
 */

struct GetUsersBasketResponse: Codable {
  
  // Indicates whether the request was successful or not
  
  let result: Int
  
  // If request was successful
  
  let sumTotal: Int?
  let itemsCount: Int?
  let products: [ItemInBasket]?
  
  // If request was unsuccessful
  
  let userMessage: String?
  
}

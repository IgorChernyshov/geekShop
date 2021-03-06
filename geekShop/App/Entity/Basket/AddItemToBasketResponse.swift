//
//  AddItemToBasketResponse.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for AddItemToBasketRequest.
 */

struct AddItemToBasketResponse: Codable {
  
  let result: Int
  let userMessage: String
  
}

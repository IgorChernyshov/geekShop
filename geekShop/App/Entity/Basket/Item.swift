//
//  Item.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for GetItemsListResponse.
 */

struct Item: Codable {
  
  let productID: Int
  let productName: String
  let productDescription: String
  let price: Int
  
}

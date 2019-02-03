//
//  GetItemsListResponse.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for GetItemListRequest.
 */

struct GetItemsListResponse: Codable {
  
  // If request was successful
  
  let pageNumber: Int?
  let products: [Item]?
  
  // If request was unsuccessful
  
  let result: Int?
  let userMessage: String?
  
}

//
//  GetItemsListRequest.swift
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

struct GetItemsListRequest: RequestRouter {
  
  let baseURL: URL
  let pageNumber: Int
  let categoryID: Int
  
  let method: HTTPMethod = .post
  let path: String = "getItemsList"
  var parameters: Parameters? {
    return [
      "page_number": pageNumber,
      "id_category": categoryID
    ]
  }
  
}

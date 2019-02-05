//
//  RemoveReviewRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to remove a specific review of a product.
 */

struct RemoveReviewRequest: RequestRouter {
  let baseURL: URL
  let reviewID: Int
  
  let method: HTTPMethod = .post
  let path: String = "removeReview"
  var parameters: Parameters? {
    return [
      "id_comment": reviewID
    ]
  }
}

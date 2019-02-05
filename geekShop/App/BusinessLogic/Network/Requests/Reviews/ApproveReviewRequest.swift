//
//  ApproveReviewRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to approve a specific review of a product.
 */

struct ApproveReviewRequest: RequestRouter {
  
  let baseURL: URL
  let reviewID: Int
  
  let method: HTTPMethod = .post
  let path: String = "approveReview"
  var parameters: Parameters? {
    return [
      "id_comment": reviewID
    ]
  }
  
}

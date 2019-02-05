//
//  AddReviewRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

/*
 This structure is used to create a request to the server to add new product's review.
 */

struct AddReviewRequest: RequestRouter {
  
  let baseURL: URL
  let userID: Int
  let text: String
  
  let method: HTTPMethod = .post
  let path: String = "addReview"
  var parameters: Parameters? {
    return [
      "id_user": userID,
      "text": text
    ]
  }
  
}

//
//  AddReviewRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

struct AddReviewRequest: RequestRouter {
  let baseURL: URL
  let userID: Int
  let text: String
  
  let method: HTTPMethod = .get
  let path: String = "addReview.json"
  var parameters: Parameters? {
    return [
      "id_user": userID,
      "text": text
    ]
  }
}

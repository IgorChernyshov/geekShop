//
//  RemoveReviewRequest.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

struct RemoveReviewRequest: RequestRouter {
  let baseURL: URL
  let reviewID: Int
  
  let method: HTTPMethod = .get
  let path: String = "removeReview.json"
  var parameters: Parameters? {
    return [
      "id_comment": reviewID
    ]
  }
}
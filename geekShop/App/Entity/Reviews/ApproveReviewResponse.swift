//
//  ApproveReviewResponse.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 Entity that decodes server response for ApproveReviewRequest.
 */

struct ApproveReviewResponse: Codable {
  
  let result: Int
  let userMessage: String
  
}

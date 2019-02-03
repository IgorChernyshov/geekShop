//
//  ApproveReviewService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to approve a specific review of a product.
 Completion handler returns server's response as a JSON.
 */

protocol ApproveReviewService {
  func approveReview(reviewID: Int, completion: @escaping (ApproveReviewResponse?) -> Void)
}

class ApproveReviewServiceImplementation: ApproveReviewService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func approveReview(reviewID: Int, completion: @escaping (ApproveReviewResponse?) -> Void) {
    let request = ApproveReviewRequest(baseURL: baseURL, reviewID: reviewID)
    networkService.request(request) { (response: ApproveReviewResponse?) in
      completion(response)
    }
  }
  
}

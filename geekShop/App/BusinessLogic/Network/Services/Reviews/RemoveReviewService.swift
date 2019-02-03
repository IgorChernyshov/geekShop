//
//  RemoveReviewService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to remove a specific review of a product.
 Completion handler returns server's response as a JSON.
 */

protocol RemoveReviewService {
  func removeReview(reviewID: Int, completion: @escaping (RemoveReviewResponse?) -> Void)
}

class RemoveReviewServiceImplementation: RemoveReviewService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func removeReview(reviewID: Int, completion: @escaping (RemoveReviewResponse?) -> Void) {
    let request = RemoveReviewRequest(baseURL: baseURL, reviewID: reviewID)
    networkService.request(request) { (response: RemoveReviewResponse?) in
      completion(response)
    }
  }
  
}

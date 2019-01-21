//
//  RemoveReviewService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

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

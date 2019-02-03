//
//  AddReviewService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to add new review.
 Completion handler returns server's response as a JSON.
 */

protocol AddReviewService {
  func addReview(userID: Int, text: String, completion: @escaping (AddReviewResponse?) -> Void)
}

class AddReviewServiceImplementation: AddReviewService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func addReview(userID: Int, text: String, completion: @escaping (AddReviewResponse?) -> Void) {
    let request = AddReviewRequest(baseURL: baseURL, userID: userID, text: text)
    networkService.request(request) { (response: AddReviewResponse?) in
      completion(response)
    }
  }
  
}

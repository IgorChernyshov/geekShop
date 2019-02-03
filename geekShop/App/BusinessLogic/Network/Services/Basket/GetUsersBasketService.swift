//
//  GetUsersBasketService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to get items that were placed into a specific user's basket.
 Completion handler returns server's response as a JSON.
 */

protocol GetUsersBasketService {
  /// A service to send a request to the server to get items of a specific category at a specific page.
  ///
  /// - Parameters:
  ///   - userID: an id of a user whose basket to return
  ///   - completion: a JSON response from the server with requested items in user's basket or an error message
  func getUsersBasket(userID: Int, completion: @escaping (GetUsersBasketResponse?) -> Void)
}

class GetUsersBasketServiceImplementation: GetUsersBasketService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func getUsersBasket(userID: Int, completion: @escaping (GetUsersBasketResponse?) -> Void) {
    let request = GetUsersBasketRequest(baseURL: baseURL, userID: userID)
    networkService.request(request) { (response: GetUsersBasketResponse?) in
      completion(response)
    }
  }
}

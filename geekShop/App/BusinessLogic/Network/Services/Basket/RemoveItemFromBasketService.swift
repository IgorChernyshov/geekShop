//
//  RemoveItemFromBasketService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to remove an item from the basket.
 Completion handler returns server's response as a JSON.
 */

protocol RemoveItemFromBasketService {
  
  /// A service to send a request to the server to remove an item from the basket.
  ///
  /// - Parameters:
  ///   - productID: an ID of the item that must be removed
  ///   - completion: a JSON response from the server which shows whether the request was successfull or not
  func removeItemFromBasket(productID: Int, completion: @escaping (RemoveItemFromBasketResponse?) -> Void)
  
}

class RemoveItemFromBasketServiceImplementation: RemoveItemFromBasketService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func removeItemFromBasket(productID: Int, completion: @escaping (RemoveItemFromBasketResponse?) -> Void) {
    let request = RemoveItemFromBasketRequest(baseURL: baseURL, productID: productID)
    networkService.request(request) { (response: RemoveItemFromBasketResponse?) in
      completion(response)
    }
  }
  
}

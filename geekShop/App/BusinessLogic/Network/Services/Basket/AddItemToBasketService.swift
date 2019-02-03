//
//  AddItemToBasketService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to add an item into the basket.
 Completion handler returns server's response as a JSON.
 */

protocol AddItemToBasketService {
  /// A service to send a request to the server to add an item to the basket.
  ///
  /// - Parameters:
  ///   - productID: an ID of the item that must be added
  ///   - quantity: number of items that must be added
  ///   - completion: a JSON response from the server which shows whether the request was successfull or not
  func addItemToBasket(productID: Int, quantity: Int, completion: @escaping (AddItemToBasketResponse?) -> Void)
}

class AddItemToBasketServiceImplementation: AddItemToBasketService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func addItemToBasket(productID: Int, quantity: Int, completion: @escaping (AddItemToBasketResponse?) -> Void) {
    let request = AddItemToBasketRequest(baseURL: baseURL, productID: productID, quantity: quantity)
    networkService.request(request) { (response: AddItemToBasketResponse?) in
      completion(response)
    }
  }
}

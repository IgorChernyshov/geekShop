//
//  GetItemsListService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 03/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This class sends a request to the server to get items of a specific category at a specific page.
 Completion handler returns server's response as a JSON.
 */

protocol GetItemsListService {
  /// A service to send a request to the server to get items of a specific category at a specific page.
  ///
  /// - Parameters:
  ///   - pageNumber: number of a requested page
  ///   - categoryID: category of a requested product
  ///   - completion: a JSON response from the server with requested items or an error message
  func getItemsList(pageNumber: Int, categoryID: Int, completion: @escaping (GetItemsListResponse?) -> Void)
}

class GetItemsListServiceImplementation: GetItemsListService {
  
  let baseURL: URL
  let networkService: NetworkService
  
  init(
    baseURL: URL,
    networkService: NetworkService) {
    
    self.baseURL = baseURL
    self.networkService = networkService
  }
  
  func getItemsList(pageNumber: Int, categoryID: Int, completion: @escaping (GetItemsListResponse?) -> Void) {
    let request = GetItemsListRequest(baseURL: baseURL, pageNumber: pageNumber, categoryID: categoryID)
    networkService.request(request) { (response: GetItemsListResponse?) in
      completion(response)
    }
  }
}

//
//  NetworkService.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkService {
  
  func request<T: Decodable>(
    _ request: URLRequestConvertible,
    completionHandler: @escaping (T?) -> Void)

}

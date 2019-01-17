//
//  ErrorParser.swift
//  geekShop
//
//  Created by Igor Chernyshov on 16/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

class ErrorParser: AbstractErrorParser {
  func parse(_ result: Error) -> Error {
    return result
  }
  
  func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
    return error
  }
}

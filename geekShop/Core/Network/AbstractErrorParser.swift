//
//  AbstractErrorParser.swift
//  geekShop
//
//  Created by Igor Chernyshov on 16/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

protocol AbstractErrorParser {
  func parse(_ result: Error) -> Error
  func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}

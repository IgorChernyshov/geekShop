//
//  Metrica.swift
//  geekShop
//
//  Created by Igor Chernyshov on 25/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This is an abstract protocol. It's required to log events with application analytics SDK's.
 */

/// This typealias is used in log method with parameters.
typealias MetricaParameters = [AnyHashable: Any]

protocol Metrica {
  
  /// This method allows to track only names of events that occured.
  ///
  /// - Parameter event: Name of an event that you want to send to the server.
  func log(event: String)
  
  
  /// This method allows to track names of events that occured as well as a dictionary of parameters.
  ///
  /// - Parameters:
  ///   - event: Name of an event that you want to send to the server.
  ///   - parameters: Dictionary of parameters that will be send to the server.
  func log(event: String, parameters: MetricaParameters?)
  
}

extension Metrica {
  
  func log(event: String) {
    log(event: event, parameters: nil)
  }
  
}

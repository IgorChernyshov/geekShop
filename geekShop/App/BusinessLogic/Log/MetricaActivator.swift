//
//  MetricaActivator.swift
//  geekShop
//
//  Created by Igor Chernyshov on 25/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation

/*
 This is an abstract protocol. It is responisble for metrica SDK activation.
 */

protocol MetricaActivator {
  
  /// This method initializes metrica SDK.
  func activate()
  
}

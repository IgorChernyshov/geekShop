//
//  YandexMetrica.swift
//  geekShop
//
//  Created by Igor Chernyshov on 25/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import Foundation
import YandexMobileMetrica

/*
 This is an implementation of Metrica protocol configured to work with YandexMobileMetrica SDK.
 */

struct YandexMetrica: Metrica, MetricaActivator {
  
  func log(event: String, parameters: MetricaParameters?) {
    YMMYandexMetrica.reportEvent(event, parameters: parameters, onFailure: nil)
  }
  
  func activate() {
    let configuration = YMMYandexMetricaConfiguration.init(apiKey: "7cc35594-a1f2-4de5-ab4e-57f23a50bf4d")
    YMMYandexMetrica.activate(with: configuration!)
  }
  
}

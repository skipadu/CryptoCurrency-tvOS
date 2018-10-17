//
//  CryptoValue.swift
//  CryptoCurrency
//
//  Created by Sami Korpela on 15.9.2018.
//  Copyright © 2018 Sami Korpela. All rights reserved.
//

import Foundation

struct CryptoValue {
  private(set) public var name: String
  var eur: Double = 0.0
  var gbp: Double = 0.0
  var jpy: Double = 0.0
  var nok: Double = 0.0
  var usd: Double = 0.0
  
  init(name: String) {
    self.name = name
  }
}

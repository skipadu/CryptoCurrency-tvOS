//
//  DataService.swift
//  CryptoCurrency
//
//  Created by Sami Korpela on 15.9.2018.
//  Copyright © 2018 Sami Korpela. All rights reserved.
//

import Foundation

class DataService {
  static let instance = DataService()
  
  private let cryptoCurrencies = [
    CryptoCurrency(shortName: "BTC", name: "Bitcoin (BTC)", imageName: "BTC"),
    CryptoCurrency(shortName: "DASH", name: "Dash (DASH)", imageName: "DASH"),
    CryptoCurrency(shortName: "ETH", name: "Ethereum (ETH)", imageName: "ETH"),
    CryptoCurrency(shortName: "LTC", name: "Litecoin (LTC)", imageName: "LTC"),
    CryptoCurrency(shortName: "XEM", name: "NEM (XEM)", imageName: "XEM")
  ]
  
  func getCryptoCurrencies() -> [CryptoCurrency] {
    return cryptoCurrencies
  }
}

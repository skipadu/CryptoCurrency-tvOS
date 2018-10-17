//
//  CryptoCompareApi.swift
//  CryptoCurrency
//
//  Created by Sami Korpela on 15.9.2018.
//  Copyright © 2018 Sami Korpela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CryptoValuesResponseCompletion = ([CryptoValue]?) -> Void

class CryptoCompareApi {
  
  let API_URL = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,LTC,ETH,DASH,XEM&tsyms=EUR,USD,JPY,NOK,GBP"
  
  func getCryptoValues(completion: @escaping CryptoValuesResponseCompletion) {
    guard let url = URL(string: API_URL) else { return }
    Alamofire.request(url).responseJSON { (response) in
      if let error = response.result.error {
        debugPrint(error.localizedDescription)
        completion(nil)
        return
      }
      
      guard let data = response.data else { return completion(nil) }
      let json = JSON(data)
      var cryptoValues = [CryptoValue]()
      
      for crypto in DataService.instance.getCryptoCurrencies() {
        var newCryptoValue = CryptoValue(name: crypto.shortName)
        newCryptoValue.eur = json[crypto.shortName]["EUR"].doubleValue
        newCryptoValue.gbp = json[crypto.shortName]["GBP"].doubleValue
        newCryptoValue.jpy = json[crypto.shortName]["JPY"].doubleValue
        newCryptoValue.nok = json[crypto.shortName]["NOK"].doubleValue
        newCryptoValue.usd = json[crypto.shortName]["USD"].doubleValue
        cryptoValues.append(newCryptoValue)
      }
      
      completion(cryptoValues)
      return
      
      
    }
  }
}

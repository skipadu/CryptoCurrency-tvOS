//
//  CryptoCurrency.swift
//  CryptoCurrency
//
//  Created by Sami Korpela on 15.9.2018.
//  Copyright © 2018 Sami Korpela. All rights reserved.
//

import Foundation

struct CryptoCurrency {
  private(set) public var shortName: String
  private(set) public var name: String
  private(set) public var imageName: String
  
  init(shortName: String, name: String, imageName: String) {
    self.shortName = shortName
    self.name = name
    self.imageName = imageName
  }
}

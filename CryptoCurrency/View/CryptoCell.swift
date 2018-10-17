//
//  CryptoCell.swift
//  CryptoCurrency
//
//  Created by Sami Korpela on 15.9.2018.
//  Copyright © 2018 Sami Korpela. All rights reserved.
//

import UIKit

class CryptoCell: UITableViewCell {
  
  @IBOutlet weak var cryptoImg: UIImageView!
  @IBOutlet weak var cryptoFullname: UILabel!
  
  @IBOutlet weak var valueEUR: UILabel!
  @IBOutlet weak var valueUSD: UILabel!
  @IBOutlet weak var valueJPY: UILabel!
  @IBOutlet weak var valueGBP: UILabel!
  @IBOutlet weak var valueNOK: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configureCell(with cryptoCurrency: CryptoCurrency) {
    cryptoImg.image = UIImage(named: cryptoCurrency.imageName)
    cryptoFullname.text = cryptoCurrency.name
  }
  
  func populateValues(with cryptoValue: CryptoValue) {
    valueEUR.text = "\(cryptoValue.eur)"
    valueGBP.text = "\(cryptoValue.gbp)"
    valueJPY.text = "\(cryptoValue.jpy)"
    valueNOK.text = "\(cryptoValue.nok)"
    valueUSD.text = "\(cryptoValue.usd)"
  }
  
}

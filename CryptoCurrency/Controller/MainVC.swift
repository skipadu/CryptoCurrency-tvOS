//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Sami Korpela on 15.9.2018.
//  Copyright © 2018 Sami Korpela. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var cryptoTableView: UITableView!
  @IBOutlet weak var lastUpdateTime: UILabel!
  
  var cryptoApi = CryptoCompareApi()
  var cryptoValues = [CryptoValue]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.cryptoTableView.delegate = self
    self.cryptoTableView.dataSource = self
    
    refreshValues()
  }
  
  func refreshValues() {
    cryptoApi.getCryptoValues { (cryptoValues) in
      guard let cryptoValues = cryptoValues else { return }
      self.cryptoValues = cryptoValues
      
      self.refreshUpdateTimeLabel()
      
      if cryptoValues.count > 0 {
        self.cryptoTableView.reloadData()
      }
    }
  }
  
  func refreshUpdateTimeLabel() {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .medium
    lastUpdateTime.text = formatter.string(from: Date())
  }
  
  @IBAction func refreshButtonTapped(_ sender: Any) {
    refreshValues()
  }
  
  // MARK: Table
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return DataService.instance.getCryptoCurrencies().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell") as? CryptoCell {
      let cryptoCurrency = DataService.instance.getCryptoCurrencies()[indexPath.row]
      cell.configureCell(with: cryptoCurrency)
      
      for value in cryptoValues {
        if(value.name == cryptoCurrency.shortName) {
          cell.populateValues(with: value)
          break
        }
      }
      return cell
    } else {
      return CryptoCell()
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
    let style = traitCollection.userInterfaceStyle
    
    if let previous = context.previouslyFocusedView,
      let cryptoCell = previous as? CryptoCell {
      cryptoCell.cryptoFullname.textColor = (style == .dark ? .white : .black)
    }
    if let next = context.nextFocusedView,
      let cryptoCell = next as? CryptoCell {
      cryptoCell.cryptoFullname.textColor = .black
    }
  }
  
  //
}


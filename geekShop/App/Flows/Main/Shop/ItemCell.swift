//
//  ItemCell.swift
//  geekShop
//
//  Created by Igor Chernyshov on 15/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This cell displays information about an item (name and price) on the main shop's screen
 */

class ItemCell: UITableViewCell {
  
  // MARK: - Outlets
  
  @IBOutlet weak var itemNameLabel: UILabel!
  @IBOutlet weak var itemPriceLabel: UILabel!
  
  // MARK: - Cell's methods
  
  func configure(with item: Item) {
    itemNameLabel.text = item.productName
    itemPriceLabel.text = "$\(item.price)"
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    itemNameLabel.text = ""
    itemPriceLabel.text = ""
    selectionStyle = .none
  }
  
}

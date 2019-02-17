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
  
  @IBOutlet weak var itemName: UILabel!
  @IBOutlet weak var itemPrice: UILabel!
  
  // MARK: - Cell's methods
  
  func configure(with item: Item) {
    itemName.text = item.productName
    itemPrice.text = String(item.price)
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    self.itemName.text = ""
    self.itemPrice.text = ""
    self.selectionStyle = .none
  }
  
}

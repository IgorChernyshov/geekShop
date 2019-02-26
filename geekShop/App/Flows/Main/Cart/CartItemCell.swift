//
//  CartItemCell.swift
//  geekShop
//
//  Created by Igor Chernyshov on 22/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This cell displays information about an item (name, price, count) on user's cart screen
 */

class CartItemCell: UITableViewCell {

  // MARK: - Outlets
  
  @IBOutlet weak var itemNameLabel: UILabel!
  @IBOutlet weak var itemPriceLabel: UILabel!
  @IBOutlet weak var itemCountLabel: UILabel!
  
  // MARK: - Cell's methods
  
  func configure(with itemInBasket: ItemInBasket) {
    itemNameLabel.text = itemInBasket.productName
    itemPriceLabel.text = "$\(itemInBasket.price)"
    itemCountLabel.text = "\(itemInBasket.quantity)"
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    
    itemNameLabel.text = ""
    itemPriceLabel.text = ""
    itemCountLabel.text = ""
    selectionStyle = .none
  }

}

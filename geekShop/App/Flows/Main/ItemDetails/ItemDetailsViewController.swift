//
//  ItemDetailsViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 17/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This view controller is displayed when an item is selected in ShopViewController.
 It shows detailed information about selected product, allows to add it to user's basket or add a review.
 */

class ItemDetailsViewController: UIViewController {

  var detailsForItem: String = ""
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationItem.title = detailsForItem
  }
  
}

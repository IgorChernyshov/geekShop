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
  
  // MARK: - Outlets
  
  @IBOutlet weak var itemDescriptionLabel: UILabel!
  @IBOutlet weak var itemPriceLabel: UILabel!
  
  // MARK: - Services
  
  private let addItemToBasketService = NetworkServiceFactory().makeAddItemToBasketService()
  
  // MARK: - Controller's variables
  
  var showItem: Item?
  
  // MARK: - Controller's methods
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    configureView()
  }
  
  /// Configures VC's title and labels with Item's information
  private func configureView() {
    guard let item = showItem else { return }
    navigationItem.title = item.productName
    itemDescriptionLabel.text = item.productDescription
    itemPriceLabel.text = "$\(item.price)"
  }
  
  // MARK: - Methods related to buttons
  
  /// Sends a request to the server to add a product to user's basket. Shows a confirmation in case of success.
  @IBAction func addToCartButtonWasPressed(_ sender: Any) {
    addItemToBasketService.addItemToBasket(productID: showItem?.productID ?? 0, quantity: 1) { [weak self] response in
      if response?.result == 1 {
        self?.showItemWasAddedToBasketAlert()
      }
    }
  }
  
  /// Shows a UIAlertController to inform user that the product was added to basket successfully.
  private func showItemWasAddedToBasketAlert() {
    let alertController = UIAlertController(title: "Success",
                                            message: "The product was added to your basket",
                                            preferredStyle: .alert)
    let continueAction = UIAlertAction(title: "Continue", style: .default)
    
    alertController.addAction(continueAction)
    present(alertController, animated: true, completion: nil)
  }
  
  @IBAction func addReviewButtonWasPressed(_ sender: Any) {
    guard let addReviewVC = storyboard?.instantiateViewController(withIdentifier: "writeReviewViewController") as? WriteReviewViewController else { return }
    
    addReviewVC.reviewForID = showItem?.productID ?? 0
    navigationController?.pushViewController(addReviewVC, animated: true)
  }
  
}

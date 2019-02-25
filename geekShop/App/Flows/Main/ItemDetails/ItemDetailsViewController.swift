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
  private let metrica = YandexMetrica()
  
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
    
    metrica.log(event: "SHOWN_ITEM_DETAILS", parameters: ["itemID": item.productID])
  }
  
  // MARK: - Methods related to buttons
  
  /// Sends a request to the server to add a product to user's basket. Shows a confirmation in case of success.
  @IBAction func addToBasketButtonWasPressed(_ sender: Any) {
    metrica.log(event: "REQUESTED_TO_ADD_ITEM_TO_BASKET", parameters: ["itemID": showItem?.productID ?? 0])
    addItemToBasketService.addItemToBasket(productID: showItem?.productID ?? 0, quantity: 1) { [weak self] response in
      if response?.result == 1 {
        self?.metrica.log(event: "ADDED_ITEM_TO_BASKET", parameters: ["itemID": self?.showItem?.productID ?? 0])
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
  
  /// Shows WriteReviewViewController where user can write a review for selected product
  @IBAction func addReviewButtonWasPressed(_ sender: Any) {
    guard let addReviewVC = storyboard?.instantiateViewController(withIdentifier: "writeReviewViewController") as? WriteReviewViewController else { return }
    
    addReviewVC.reviewForID = showItem?.productID ?? 0
    metrica.log(event: "STARTED_TO_WRITE_REVIEW", parameters: ["itemID": showItem?.productID ?? 0])
    navigationController?.pushViewController(addReviewVC, animated: true)
  }
  
}

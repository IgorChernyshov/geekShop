//
//  CartViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 22/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This view controller shows current user's cart.
 He is able to remove items from the cart or proceed to checkout.
 */

class CartViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Services
  
  let getUsersBasketService = NetworkServiceFactory().makeGetUsersBasketService()
  let metrica = YandexMetrica()
  
  // MARK: - ViewController configuration
  
  override func viewDidLoad() {
    configureTableView()
  }
  
  // MARK: - Table View configuration
  
  private var itemsInBasket: [ItemInBasket] = []
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    
    loadItemsList()
  }
  
  /// Sends a request to the server to get user's cart content. Returned items will be loaded into tableView
  private func loadItemsList() {
    getUsersBasketService.getUsersBasket(userID: 7) { [weak self] response in
      guard let itemsInBasketList = response?.products else { return }
      
      self?.itemsInBasket = itemsInBasketList
      self?.tableView.reloadData()
    }
  }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemsInBasket.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cartItemCell") as? CartItemCell else {
      return UITableViewCell()
    }

    cell.configure(with: itemsInBasket[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    var action = [UITableViewRowAction]()
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Remove") { [weak self] (rowAction, indexPath) in
      guard let strongSelf = self else { return }
      
      self?.metrica.log(event: "DELETED_ITEM_FROM_BASKET",
                        parameters: ["itemID": strongSelf.itemsInBasket[indexPath.row].productID])
      strongSelf.itemsInBasket.remove(at: indexPath.row)
      strongSelf.tableView.reloadData()
    }
    deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
    action = [deleteAction]
    
    return action
  }
  
}

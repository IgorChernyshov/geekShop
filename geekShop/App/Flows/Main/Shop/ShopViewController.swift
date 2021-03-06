//
//  ShopViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 15/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This view controller displays main shop window with items
 */

class ShopViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: - Services
  
  private let getItemListService = NetworkServiceFactory().makeGetItemsListService()
  private let logoutService = NetworkServiceFactory().makeLogoutService()
  private let metrica = YandexMetrica()
  
  // MARK: - ViewController configuration
  
  override func viewDidLoad() {
    configureTableView()
  }
  
  // MARK: - Table View configuration
  
  private var items: [Item] = []
  
  private func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    
    loadItemsList()
  }

  /// Sends a request to the server to get items list. Returned items will be loaded into tableView
  private func loadItemsList() {
    metrica.log(event: "REQUESTED_PRODUCTS_LIST")
    
    getItemListService.getItemsList(pageNumber: 1, categoryID: 1) { [weak self] response in
      guard let itemsList = response?.products else { return }
      
      self?.metrica.log(event: "LOADED_PRODUCTS_LIST_SUCCESSFULLY")
      self?.items = itemsList
      self?.tableView.reloadData()
    }
  }
  
  // MARK: - Methods related to buttons
  
  /// Signs out current user
  @IBAction func logoutButtonWasPressed(_ sender: Any) {
    metrica.log(event: "REQUESTED_LOGOUT")
    
    logoutService.logout(userID: 123) { [weak self] response in
      if response?.result == 1 {
        UserDefaults.standard.set(false, forKey: "userIsLoggedIn")
        UserDefaults.standard.set("", forKey: "currentUserPassword")
        
        self?.metrica.log(event: "LOGOUT_SUCCESSFUL")
        
        self?.dismiss(animated: true, completion: nil)
      }
    }
  }
  
  /// Sends user to CartViewController which shows items that were added to cart by current user.
  @IBAction func showCartButtonWasPressed(_ sender: Any) {
    guard let cartVC = storyboard?.instantiateViewController(withIdentifier: "cartViewController") as?
      CartViewController else { return }
    
    navigationController?.pushViewController(cartVC, animated: true)
  }
  
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as? ItemCell else {
      return UITableViewCell()
    }
    cell.configure(with: items[indexPath.row])
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let itemDetailsVC = storyboard?.instantiateViewController(withIdentifier: "itemDetailsViewController") as? ItemDetailsViewController else {
      return
    }
    itemDetailsVC.showItem = items[indexPath.row]
    navigationController?.pushViewController(itemDetailsVC, animated: true)
  }
  
}

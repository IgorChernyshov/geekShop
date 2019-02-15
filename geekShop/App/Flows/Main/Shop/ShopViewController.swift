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
  
  let getItemListService = NetworkServiceFactory().makeGetItemsListService()
  
  // MARK: - ViewController configuration
  
  override func viewDidLoad() {
    configureTableView()
  }
  
  // MARK: - TableViewController configuration
  
  var items: [Item] = []
  
  func configureTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    
    loadItemsList()
  }

  /// Sends a request to the server to get items list. Returned items will be loaded into tableView
  func loadItemsList() {
    getItemListService.getItemsList(pageNumber: 1, categoryID: 1) { [weak self] response in
      guard let itemsList = response?.products else { return }
      
      self?.items = itemsList
      self?.tableView.reloadData()
    }
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
    
    cell.itemName.text = items[indexPath.row].productName
    cell.itemPrice.text = String(items[indexPath.row].price)
    
    return cell
  }
  
}

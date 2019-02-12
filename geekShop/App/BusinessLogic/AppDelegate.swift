//
//  AppDelegate.swift
//  geekShop
//
//  Created by Igor Chernyshov on 12/01/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  // Create test instances of services to test API calls
  
  // User-related services
  
  let logoutService = NetworkServiceFactory().makeLogoutService()
  
  // Review-related services
  
  let addReviewService = NetworkServiceFactory().makeAddReviewService()
  let approveReviewService = NetworkServiceFactory().makeApproveReviewService()
  let removeReviewService = NetworkServiceFactory().makeRemoveReviewService()
  
  // Basket-related services
  
  let addItemToBasketService = NetworkServiceFactory().makeAddItemToBasketService()
  let removeItemFromBasketService = NetworkServiceFactory().makeRemoveItemFromBasketService()
  let getItemListService = NetworkServiceFactory().makeGetItemsListService()
  let getUsersBasketService = NetworkServiceFactory().makeGetUsersBasketService()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // MARK: - Test user-related API calls
    
    logoutService.logout(userID: 123) { response in
      // TODO: If response.result = 1 - change UserDefaults isLoggedIn and open login screen
      print(response.debugDescription)
    }
    
    // MARK: - Test review-related API calls
    
    addReviewService.addReview(userID: 123, text: "Very nice stuff. Received it in three weeks") { response in
      // TODO: If response.result = 1 - show Alert "Thank you for your review! It will appear on the page soon"
      print(response.debugDescription)
    }
    
    approveReviewService.approveReview(reviewID: 333) { response in
      // TODO: If response.result = 1 - show Alert "Review #... has been approved"
      print(response.debugDescription)
    }
    
    removeReviewService.removeReview(reviewID: 333) { response in
      // TODO: If response.result = 1 - show Alert "Review #... has been removed"
      print(response.debugDescription)
    }
    
    // MARK: - Test basket-related API calls
    
    addItemToBasketService.addItemToBasket(productID: 5, quantity: 1) { response in
      print(response.debugDescription)
    }
    
    removeItemFromBasketService.removeItemFromBasket(productID: 7) { response in
      print(response.debugDescription)
    }
    
    getItemListService.getItemsList(pageNumber: 1, categoryID: 12) { response in
      print(response.debugDescription)
    }
    
    getUsersBasketService.getUsersBasket(userID: 123) { response in
      print(response.debugDescription)
    }
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }
  
  
}


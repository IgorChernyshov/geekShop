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
  
  // Review-related services

  let approveReviewService = NetworkServiceFactory().makeApproveReviewService()
  let removeReviewService = NetworkServiceFactory().makeRemoveReviewService()
  
  // Basket-related services
  
  let removeItemFromBasketService = NetworkServiceFactory().makeRemoveItemFromBasketService()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // MARK: - Application started in UI Tests mode
    
    if CommandLine.arguments.contains("--uitesting") {
      UserDefaults.standard.set(false, forKey: "userIsLoggedIn")
      UserDefaults.standard.set("", forKey: "currentUserLogin")
      UserDefaults.standard.set("", forKey: "currentUserPassword")
    }
    
    // MARK: - Application started in Normal mode
    
    // MARK: - Test review-related API calls
    
    approveReviewService.approveReview(reviewID: 333) { response in
      // TODO: If response.result = 1 - show Alert "Review #... has been approved"
      print(response.debugDescription)
    }
    
    removeReviewService.removeReview(reviewID: 333) { response in
      // TODO: If response.result = 1 - show Alert "Review #... has been removed"
      print(response.debugDescription)
    }
    
    // MARK: - Test basket-related API calls
    
    removeItemFromBasketService.removeItemFromBasket(productID: 7) { response in
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


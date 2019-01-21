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
  
  let authService = NetworkServiceFactory().makeAuthService()
  let registerService = NetworkServiceFactory().makeRegisterService()
  let logoutService = NetworkServiceFactory().makeLogoutService()
  let changeUserDataService = NetworkServiceFactory().makeChangeUserDataService()
  let addReviewService = NetworkServiceFactory().makeAddReviewService()
  let approveReviewService = NetworkServiceFactory().makeApproveReviewService()
  let removeReviewService = NetworkServiceFactory().makeRemoveReviewService()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // MARK: - Test API calls
    authService.login(login: "admin", password: "ezP@$$") { user in
      // TODO: If user != nil - change UserDefaults isLoggedIn and open main VC
      print(user)
    }
    
    registerService.register(login: "admin", password: "ezP@$$", email: "admin@geekshop.com") { response in
      // TODO: If response.result = 1 - show Alert "Registration went successful", then login user and open main VC
      print(response)
    }
    
    logoutService.logout(userID: 123) { response in
      // TODO: If response.result = 1 - change UserDefaults isLoggedIn and open login screen
      print(response)
    }
    
    let newUserProfileData = UserProfileData(
      userID: 123,
      login: "",
      password: "",
      email: "",
      gender: "",
      creditCardNumber: "1234-5678-9012-3456",
      bio: ""
    )
    
    changeUserDataService.changeUserProfile(data: newUserProfileData) { response in
        // TODO: If response.result = 1 - show Alert "Profile has been saved" and update profile screen
        print(response)
    }
    
    addReviewService.addReview(userID: 123, text: "Very nice stuff. Received it in three weeks") { response in
      // TODO: If response.result = 1 - show Alert "Thank you for your review! It will appear on the page soon"
      print(response)
    }
    
    approveReviewService.approveReview(reviewID: 333) { response in
      // TODO: If response.result = 1 - show Alert "Review #... has been approved"
      print(response)
    }
    
    removeReviewService.removeReview(reviewID: 333) { response in
      // TODO: If response.result = 1 - show Alert "Review #... has been removed"
      print(response)
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


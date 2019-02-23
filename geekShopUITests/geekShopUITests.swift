//
//  geekShopUITests.swift
//  geekShopUITests
//
//  Created by Igor Chernyshov on 22/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import XCTest

class geekShopUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    
    app = XCUIApplication()
    app.launch()
  }
  
  func testSignInSuccessful() {
    authenticateWith(login: "Frostfell", password: "123456")
    
    let logoutButton = app.buttons["showCartButton"]
    logoutButton.tap()
  }
  
  func testSignInFailed() {
    authenticateWith(login: "Odmin", password: "123")
    
    let signUpButton = app.buttons["signUpButton"]
    signUpButton.tap()
  }
  
  private func authenticateWith(login: String, password: String) {
    let loginTextField = app.textFields["loginTextField"]
    loginTextField.tap()
    loginTextField.typeText(login)
    
    let passwordTextField = app.secureTextFields["passwordTextField"]
    passwordTextField.tap()
    passwordTextField.typeText(password)
    
    let signInButton = app.buttons["signInButton"]
    signInButton.tap()
  }
  
}

//
//  geekShopUITests.swift
//  geekShopUITests
//
//  Created by Igor Chernyshov on 22/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import XCTest

class AuthenticationFlowUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    
    app = XCUIApplication()
    app.launchArguments.append("--uitesting")
    app.launch()
  }
  
  // MARK: - SignInViewController tests
  
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
  
  // MARK: - SignUpViewController tests
  
  func testSignUpSuccessful() {
    navigateToSignUpController()
    signUpWith(login: "Igor", password: "123456", repeatedPassword: "123456", email: "test@mail.ru")
    let alertController = alertWith(title: "Success")
    
    alertController.buttons["OK"].tap()
  }
  
  func testSignUpFailedEmptyLogin() {
    navigateToSignUpController()
    signUpWith(login: "", password: "123456", repeatedPassword: "123456", email: "test@mail.ru")
    let alertController = alertWith(title: "Error")
    
    alertController.buttons["OK"].tap()
  }
  
  func testSignUpFailedEmptyPassword() {
    navigateToSignUpController()
    signUpWith(login: "Igor", password: "", repeatedPassword: "123456", email: "test@mail.ru")
    let alertController = alertWith(title: "Error")
    
    alertController.buttons["OK"].tap()
  }
  
  func testSignUpFailedEmptyRepeatedPassword() {
    navigateToSignUpController()
    signUpWith(login: "Igor", password: "123456", repeatedPassword: "", email: "test@mail.ru")
    let alertController = alertWith(title: "Error")
    
    alertController.buttons["OK"].tap()
  }
  
  func testSignUpFailedEmptyEmail() {
    navigateToSignUpController()
    signUpWith(login: "Igor", password: "123456", repeatedPassword: "123456", email: "")
    let alertController = alertWith(title: "Error")
    
    alertController.buttons["OK"].tap()
  }
  
  func testSignUpFailedPasswordsMismatch() {
    navigateToSignUpController()
    signUpWith(login: "Igor", password: "123456", repeatedPassword: "123465", email: "test@mail.ru")
    let alertController = alertWith(title: "Error")
    
    alertController.buttons["OK"].tap()
  }
  
  private func navigateToSignUpController() {
    let signUpButton = app.buttons["signUpButton"]
    signUpButton.tap()
  }
  
  private func signUpWith(login: String, password: String, repeatedPassword: String, email: String) {
    let loginTextField = app.textFields["loginTextField"]
    loginTextField.tap()
    loginTextField.typeText(login)
    
    let passwordTextField = app.secureTextFields["passwordTextField"]
    passwordTextField.tap()
    passwordTextField.typeText(password)
    
    let repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
    repeatPasswordTextField.tap()
    repeatPasswordTextField.typeText(repeatedPassword)
    
    let emailTextField = app.textFields["emailTextField"]
    emailTextField.tap()
    emailTextField.typeText(email)
    
    let signUpButton = app.buttons["submitButton"]
    signUpButton.tap()
  }
  
  private func alertWith(title: String) -> XCUIElement {
    let alertController = app.alerts[title]
    let exists = NSPredicate(format: "exists == 1")
    
    expectation(for: exists, evaluatedWith: alertController, handler: nil)
    waitForExpectations(timeout: 2, handler: nil)
    
    return alertController
  }
  
}

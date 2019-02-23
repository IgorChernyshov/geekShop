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
    signUpWith(login: "Igor", password: "123456", email: "test@mail.ru")
    
    let successfulRegistrationMessage = "Your registration has been completed successfully"
    let token = addUIInterruptionMonitor(withDescription: successfulRegistrationMessage,
                                         handler: { alert in alert.buttons["OK"].tap()
                                          return true })
    
    RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
    removeUIInterruptionMonitor(token)
  }
  
  func testSignUpFailed() {
    navigateToSignUpController()
    signUpWith(login: "Igor", password: "", email: "test@mail.ru")
    
    let unsuccessfulRegistrationMessage = "Please fill all fields and check that both passwords match"
    let token = addUIInterruptionMonitor(withDescription: unsuccessfulRegistrationMessage,
                                         handler: { alert in alert.buttons["OK"].tap()
                                          return true })
    
    RunLoop.current.run(until: Date(timeInterval: 2, since: Date()))
    removeUIInterruptionMonitor(token)
  }
  
  private func navigateToSignUpController() {
    let signUpButton = app.buttons["signUpButton"]
    signUpButton.tap()
  }
  
  private func signUpWith(login: String, password: String, email: String) {
    let loginTextField = app.textFields["loginTextField"]
    loginTextField.tap()
    loginTextField.typeText(login)
    
    let passwordTextField = app.secureTextFields["passwordTextField"]
    passwordTextField.tap()
    passwordTextField.typeText(password)
    
    let repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
    repeatPasswordTextField.tap()
    repeatPasswordTextField.typeText(password)
    
    let emailTextField = app.textFields["emailTextField"]
    emailTextField.tap()
    emailTextField.typeText(email)
    
    let signUpButton = app.buttons["submitButton"]
    signUpButton.tap()
  }
  
}

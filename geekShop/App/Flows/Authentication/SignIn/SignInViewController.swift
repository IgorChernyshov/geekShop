//
//  SignInViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 08/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This controller allows a user to either sign into the application or to open account creation screen
 */

class SignInViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var loginTextField: GreenPlaceholderTextField!
  @IBOutlet weak var passwordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var signInButton: GreenRoundedButton!
  
  // MARK: - Services
  
  private let authService = NetworkServiceFactory().makeAuthService()
  private let metrica = YandexMetrica()
  
  // MARK: - Methods called by button tap
  
  /// Sends a request to the server to sign in a user
  @IBAction func signInButtonWasPressed(_ sender: Any) {
    if loginAndPasswordInserted() {
      let login = loginTextField.text!
      let password = passwordTextField.text!
      metrica.log(event: "REQUESTED_SIGN_IN")
      
      authService.login(login: login, password: password, cookie: "") { [weak self] user in
        UserDefaults.standard.set(true, forKey: "userIsLoggedIn")
        UserDefaults.standard.set(login, forKey: "currentUserLogin")
        UserDefaults.standard.set(password, forKey: "currentUserPassword")
        self?.metrica.log(event: "SIGN_IN_SUCCESSFUL")
        
        self?.performSegue(withIdentifier: "toMainVC", sender: self)
      }
    }
  }
  
  /// Checks if both login and password are inserted and the password matches minimum length
  ///
  /// - Returns: the result of check up
  private func loginAndPasswordInserted() -> Bool {
    var loginInserted: Bool {
      return loginTextField.text != ""
    }
    
    var passwordInserted: Bool {
      let minimumPasswordLength: Int = 6
      
      return passwordTextField.text?.count ?? 0 >= minimumPasswordLength
    }
    
    if !loginInserted {
      metrica.log(event: "SIGN_IN_FAILED", parameters: ["reason": "Login missing"])
      return false
    }
    
    if !passwordInserted {
      metrica.log(event: "SIGN_IN_FAILED", parameters: ["reason": "Password is less than 6 characters"])
      return false
    }
    
    return true
  }
  
  /// Opens Sign Up screen where user can create a new account
  @IBAction func signUpButtonWasPressed(_ sender: Any) {
    self.performSegue(withIdentifier: "toSignUpVC", sender: self)
  }
  
  // MARK: - ViewController methods
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let userLogin = UserDefaults.standard.string(forKey: "currentUserLogin") {
      self.loginTextField.text = userLogin
    }
    if let userPassword = UserDefaults.standard.string(forKey: "currentUserPassword") {
      self.passwordTextField.text = userPassword
    }
  }
  
}

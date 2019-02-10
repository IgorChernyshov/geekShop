//
//  SignInViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 08/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var loginTextField: GreenPlaceholderTextField!
  @IBOutlet weak var passwordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var signInButton: UIButton!
  
  // MARK: - Services
  private let authService = NetworkServiceFactory().makeAuthService()
  
  // MARK: - Buttons configuration
  @IBAction func signInButtonWasPressed(_ sender: Any) {
    if loginAndPasswordInserted() {
      let login = loginTextField.text!
      let password = passwordTextField.text!
      
      authService.login(login: login, password: password, cookie: "") { [weak self] user in
        UserDefaults.standard.set(true, forKey: "userIsLoggedIn")
        UserDefaults.standard.set(login, forKey: "currentUserLogin")
        UserDefaults.standard.set(password, forKey: "currentUserPassword")
        self?.performSegue(withIdentifier: "toMainVC", sender: self)
      }
    }
  }
  
  @IBAction func signUpButtonWasPressed(_ sender: Any) {
    self.performSegue(withIdentifier: "toSignUpVC", sender: self)
  }
  
  // MARK: - Controller methods
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if let userLogin = UserDefaults.standard.string(forKey: "currentUserLogin") {
      self.loginTextField.text = userLogin
    }
    if let userPassword = UserDefaults.standard.string(forKey: "currentUserPassword") {
      self.passwordTextField.text = userPassword
    }
  }
  
  private func loginAndPasswordInserted() -> Bool {
    var loginInserted: Bool {
      if loginTextField.text != "" {
        return true
      }
      return false
    }
    
    var passwordInserted: Bool {
      let minimumPasswordLength: Int = 6
      if passwordTextField.text?.count ?? 0 >= minimumPasswordLength {
        return true
      }
      return false
    }
    
    return loginInserted && passwordInserted
  }
  
}

//
//  SignUpViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 08/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This controller allows a user to create a new account
 */

class SignUpViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var loginTextField: GreenPlaceholderTextField!
  @IBOutlet weak var passwordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var repeatPasswordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var emailTextField: GreenPlaceholderTextField!
  
  // MARK: - Services
  
  private let registerService = NetworkServiceFactory().makeRegisterService()
  
  // MARK: - Methods called by button tap
  
  
  /// Sends a request to the server to create a new user
  @IBAction func signUpButtonWasPressed(_ sender: Any) {
    if allFieldsAreFilled() {
      let login = loginTextField.text ?? ""
      let password = passwordTextField.text ?? ""
      let email = emailTextField.text ?? ""
      
      let userProfileData = UserProfileData(
        userID: 1,
        login: login,
        password: password,
        email: email,
        gender: "",
        creditCardNumber: "",
        bio: ""
      )
      
      registerService.register(data: userProfileData) { [weak self] response in
        UserDefaults.standard.set(login, forKey: "currentUserLogin")
        self?.showSuccessfullRegistrationAlert()
      }
    }
  }
  
  /// Checks if all required fields are filled and both inserted passwords match each other
  private func allFieldsAreFilled() -> Bool {
    var loginIsInserted: Bool {
      return loginTextField.text != ""
    }
    
    var passwordsAreValidated: Bool {
      let repeatedPasswordIsPresent = repeatPasswordTextField.text != ""
      let passwordsMatch = passwordTextField.text == repeatPasswordTextField.text
      
      return repeatedPasswordIsPresent && passwordsMatch
    }
    
    var emailIsInserted: Bool {
      return emailTextField.text != ""
    }
    
    return loginIsInserted && passwordsAreValidated && emailIsInserted
  }
  
  /// Shows a UIAlertController to inform user that his registration was successful
  private func showSuccessfullRegistrationAlert() {
    let alertController = UIAlertController(title: "Success",
                                       message: "Your registration has been completed successfully",
                                       preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] action in
      self?.navigationController?.popViewController(animated: true)
    }
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

}

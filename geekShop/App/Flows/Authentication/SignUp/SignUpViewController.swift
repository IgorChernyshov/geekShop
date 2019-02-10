//
//  SignUpViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 08/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var loginTextField: GreenPlaceholderTextField!
  @IBOutlet weak var passwordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var repeatPasswordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var emailTextField: GreenPlaceholderTextField!
  
  // MARK: - Services
  private let registerService = NetworkServiceFactory().makeRegisterService()
  
  // MARK: - Buttons Configuration
  @IBAction func signUpButtonWasPressed(_ sender: Any) {
    if allFieldsAreFilled() {
      let login = loginTextField.text!
      let password = passwordTextField.text!
      let email = emailTextField.text!
      
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
  
  //  registerService.register(data: newUserProfileData) { response in
  //  // TODO: If response.result = 1 - show Alert "Registration went successful", then login user and open main VC
  //  print(response.debugDescription)
  //  }
  
}

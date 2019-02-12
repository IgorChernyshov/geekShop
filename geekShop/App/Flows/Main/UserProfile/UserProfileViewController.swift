//
//  UserProfileViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 10/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This controller shows user's profile data and allows to change it
 */

class UserProfileViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var loginTextField: GreenPlaceholderTextField!
  @IBOutlet weak var passwordTextField: GreenPlaceholderTextField!
  @IBOutlet weak var emailTextField: GreenPlaceholderTextField!
  @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
  @IBOutlet weak var creditCardNumberTextField: GreenPlaceholderTextField!
  @IBOutlet weak var bioTextView: UITextView!
  
  // MARK: - Services
  
  let changeUserDataService = NetworkServiceFactory().makeChangeUserDataService()
  
  // MARK: - Methods called by button tap
  
  @IBAction func saveButtonWasPressed(_ sender: Any) {
    let login = loginTextField.text ?? ""
    let password = passwordTextField.text ?? ""
    let email = emailTextField.text ?? ""
    let gender = genderSegmentedControl.selectedSegmentIndex.description
    let creditCardNumber = creditCardNumberTextField.text ?? ""
    let bio = bioTextView.text ?? ""
    
    let newUserProfileData = UserProfileData(
      userID: 1,
      login: login,
      password: password,
      email: email,
      gender: gender,
      creditCardNumber: creditCardNumber,
      bio: bio
    )
    
    changeUserDataService.changeUserProfile(data: newUserProfileData) { [weak self] response in
      self?.showUserProfileWasChangedAlert()
    }
  }
  
  private func showUserProfileWasChangedAlert() {
    let alertController = UIAlertController(title: "Success",
                                            message: "Your data has been changed successfully",
                                            preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] action in
      self?.navigationController?.popViewController(animated: true)
    }
    alertController.addAction(okAction)
    present(alertController, animated: true, completion: nil)
  }

}

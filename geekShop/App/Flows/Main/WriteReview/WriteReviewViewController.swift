//
//  WriteReviewViewController.swift
//  geekShop
//
//  Created by Igor Chernyshov on 18/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This view controller is displayed when Add Review button is tapped on a product's details screen.
 It allows users to write reviews for selected products and send them to moderators.
 */

class WriteReviewViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var reviewTextView: UITextView!
  
  // MARK: - Controller's variables
  
  var reviewForID: Int = 0
  
  // MARK: - Services
  
  private let addReviewService = NetworkServiceFactory().makeAddReviewService()
  
  // MARK: - Button's methods
  
  /// Checks if there is text entered. If yes, sends an API call to the server to add the review.
  @IBAction func doneButtonWasPressed(_ sender: Any) {
    guard let reviewText = reviewTextView.text, reviewText != "" else { return }
    reviewTextView.resignFirstResponder()
    
    addReviewService.addReview(userID: 123, text: reviewText) { [weak self] response in
      if response?.result == 1 {
        self?.showReviewWasSentAlert()
      }
    }
  }
  
  /// Shows a UIAlertController to inform user that his/her review was sent to moderators.
  private func showReviewWasSentAlert() {
    let alertController = UIAlertController(title: "Thank you!",
                                            message: "Your review will appear shortly",
                                            preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "Dismiss", style: .default) { [weak self] action in
      self?.navigationController?.popViewController(animated: true)
    }
    
    alertController.addAction(dismissAction)
    present(alertController, animated: true, completion: nil)
  }
  
}

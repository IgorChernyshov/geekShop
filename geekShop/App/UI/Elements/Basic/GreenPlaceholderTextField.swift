//
//  GreenPlaceholderTextField.swift
//  geekShop
//
//  Created by Igor Chernyshov on 08/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

@IBDesignable
class GreenPlaceholderTextField: UITextField {
  
  override func awakeFromNib() {
    let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 0.750588613)])
    self.attributedPlaceholder = placeholder
    super.awakeFromNib()
  }
  
}

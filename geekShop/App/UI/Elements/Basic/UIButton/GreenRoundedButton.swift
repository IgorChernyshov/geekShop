//
//  GreenRoundedButton.swift
//  geekShop
//
//  Created by Igor Chernyshov on 21/02/2019.
//  Copyright © 2019 Igor Chernyshov. All rights reserved.
//

import UIKit

/*
 This is a green button with thin rounded borders and Menlo Regular font
 */

class GreenRoundedButton: UIButton {

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    clipsToBounds = true
    layer.cornerRadius = 3.0
    layer.borderWidth = 1.0
    layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
    
    let currentFontSize = titleLabel?.font.pointSize
    titleLabel?.font = UIFont(name: "Menlo-Regular", size: currentFontSize ?? 14.0)
    setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0, alpha: 1), for: .normal)
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    contentEdgeInsets = padding
  }

}

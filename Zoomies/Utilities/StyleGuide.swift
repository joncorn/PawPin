//
//  StyleGuide.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class StyleGuide {
  
  // MARK: - Constants
  struct Constants {
    static let cornerRadius: CGFloat = 10
    static let dogCornerRadius: CGFloat = 5
  }
  
  // MARK: - Views
  static func styleViewsCornerRadius(_ view: UIView) {
    view.layer.cornerRadius = Constants.cornerRadius
  }
  
  // MARK: - TextFields
  // Default
  static func styleTextField(_ textField: UITextField) {
    let font = UIFont(name: "System", size: 23)
//    let bottomLine = CALayer()
    
//    bottomLine.frame = CGRect(x: textField.frame.origin.x, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
//    bottomLine.backgroundColor = UIColor.init(red: 255/255, green: 150/255, blue: 102/255, alpha: 1).cgColor
    textField.borderStyle = .none
//    textField.layer.addSublayer(bottomLine)
    textField.font = font
    
  }
  
  // MARK: - Buttons
  
  // Login/Signup
  static func styleLoginSignupButton(_ button: UIButton) {
    button.layer.cornerRadius = 73 / 2
  }

} // Class end

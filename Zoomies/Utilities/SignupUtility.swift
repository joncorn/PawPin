//
//  SignupUtility.swift
//  Zoomies
//
//  Created by Jon Corn on 3/31/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class SignupUtility {
  
  func validateName(firstName: UITextField, lastName: UITextField) -> String? {
    
    // Check if fields have a value
    if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
      lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      
      // If not, return this string
      return "Please fill in both fields"
    }
    
    // Otherwise, don't return a value
    return nil
  }
  
  func validateEmailPass(email: UITextField, password: UITextField) -> String? {
    
    // Check if fields have a value
    if email.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
      password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      
      // If not, return this string
      return "Please fill in both fields"
    }
    
    // Check if password is secure
    let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    if LoginUtility.isPasswordValid(cleanedPassword) == false {
      return "Please make sure your password is at least 8 characters, and contains a special character and number."
    }
    
    // Otherwise, don't return a value
    return nil
  }
}

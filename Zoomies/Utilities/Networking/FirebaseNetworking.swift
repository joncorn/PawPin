//
//  FirebaseNetworking.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class FirebaseNetworking {
  
  // MARK: - Create User
  static func createUser(firstName: String, lastName: String, email: String, password: String, errorLabel: UILabel, completion: @escaping(Bool) -> Void) {
    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
      if error != nil {
        showErrorLabel(message: "Error creating user", errorLabel: errorLabel)
      } else {
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: ["firstName":firstName, "lastName":lastName, "uid":result!.user.uid]) { (error) in
          if error != nil {
            showErrorLabel(message: "Error saving user data", errorLabel: errorLabel)
          }
        }
      }
    }
    completion(true)
  }
  
  // MARK:  Show error label
  static func showErrorLabel(message: String, errorLabel: UILabel) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  // MARK:  Transition to home
  func transitionToHome() {
    let storyboard = UIStoryboard()
    let homeViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
    
  }
}

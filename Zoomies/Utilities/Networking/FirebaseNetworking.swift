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
  
  // MARK: - CREATE USER
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
  
  // MARK: - SHOW ERROR LABEL
  static func showErrorLabel(message: String, errorLabel: UILabel) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  // MARK: - RESET PASSWORD
  static func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping(_ errorMessage: String) -> Void) {
    Auth.auth().sendPasswordReset(withEmail: email) { (error) in
      if error == nil {
        onSuccess()
      } else {
        onError(error!.localizedDescription)
      }
    }
  }
}

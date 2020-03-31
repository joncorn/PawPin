//
//  SignUpViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
  
  // MARK: - Outlets
  
  // Views
  @IBOutlet weak var lastNameView: UIView!
  @IBOutlet weak var firstNameView: UIView!
  
  // Text Fields
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupElements()
  }
  
  // MARK: - Actions
//  @IBAction func nextButtonTapped(_ sender: Any) {
//    //  Validate fields
//    let error = validateFields()
//    if error != nil {
//      showError(error!)
//    } else {
//      let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//      let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//      
//      // MARK:  Create user
//      FirebaseNetworking.createUser(firstName: firstName, lastName: lastName, email: email, password: password, errorLabel: errorLabel) { (error) in
//        if !error {
//          print("there was an error")
//        } else {
//          self.transitionToHome()
//        }
//      }
//    }
//  }
  
  
  
  // MARK: - Methods
//  func validateFields() -> String? {
//    //  Checks if fields are filled in
//    if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//      lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//      emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
//      passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
//      //  Else return this error
//      return "Please fill in all fields"
//    }
//    //  Check if password is secure
//    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//    if LoginUtility.isPasswordValid(cleanedPassword) == false {
//      return "Please make sure your password is at least 8 characters, and contains a special character and number."
//    }
//    return nil
//  }
  
  func transitionToHome() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let homeViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
    guard let window = view.window else {return}
    window.rootViewController = homeViewController
    window.makeKeyAndVisible()
  }
  
  func setupElements() {
    
    // Setup views
    firstNameView.layer.cornerRadius = 10
    lastNameView.layer.cornerRadius = 10
    signUpButton.layer.cornerRadius = 10
  }
  
  // MARK: - SEGUE
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toEmailPassVC" {
      
      guard let destinationVC = segue.destination as? SignUpEmailPassViewController,
        let firstName = firstNameTextField.text, !firstName.isEmpty,
        let lastName = lastNameTextField.text, !lastName.isEmpty
        else { return }
      
      destinationVC.firstNameLanding = firstName
      destinationVC.lastNameLanding = lastName
      
    }
  }
}

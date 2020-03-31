//
//  SignUpEmailPassViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/31/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class SignUpEmailPassViewController: UIViewController {
  
  // MARK: - PROPERTIES
  var firstNameLanding: String? {
    didSet {
      print(firstNameLanding as Any)
    }
  }
  var lastNameLanding: String? {
    didSet {
      print(lastNameLanding as Any)
    }
  }
  
  // MARK: - OUTLETS
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var passwordView: UIView!
  
  // Textfields
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  // Labels
  @IBOutlet weak var errorLabel: UILabel!
  
  // Buttons
  @IBOutlet weak var submitButton: UIButton!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupViews()
  }
  
  // MARK: - ACTIONS
  @IBAction func submitButtonTapped(_ sender: Any) {
    // If there aren't any values in the name fields, user won't be created
    guard let firstName = firstNameLanding,
      let lastName = lastNameLanding else { return }

    // Validate fields
    let error = SignupUtility().validateEmailPass(email: emailTextField, password: passwordTextField)
    if error != nil {
      showError(error!)
    } else {
      
      // If there's no error, grab what's in the text fields..
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      // MARK:  Create user
      FirebaseNetworking.createUser(firstName: firstName, lastName: lastName, email: email, password: password, errorLabel: errorLabel) { (error) in
        if !error {
          print("There was an error.")
        } else {
          self.transitionToHome()
        }
      }
    }
  }
  
  // MARK: - METHODS
  func setupViews() {
    // Make error label invisible
    errorLabel.alpha = 0
    
    // Setup views
    emailView.layer.cornerRadius = 10
    passwordView.layer.cornerRadius = 10
    submitButton.layer.cornerRadius = 10
  }
  
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  func transitionToHome() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let homeViewController = storyboard.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
    guard let window = view.window else {return}
    window.rootViewController = homeViewController
    window.makeKeyAndVisible()
  }
  
}

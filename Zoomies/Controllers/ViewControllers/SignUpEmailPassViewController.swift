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
    setupTextFields()
    setupTapGesture()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    errorLabel.alpha = 0
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
          self.performSegue(withIdentifier: Constants.Storyboard.Segues.toHomeScreen, sender: self)
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
  
  func setupTextFields() {
    
    // Create toolbar
    let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
    
    // Create left side empty space so that done button set on right side
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    // Create done button
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    
    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    
    // Add toolbar to keyboards
    emailTextField.inputAccessoryView = toolbar
    passwordTextField.inputAccessoryView = toolbar
    
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
} // Class end

// MARK: - UITextFieldDelegate
extension SignUpEmailPassViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return false
  }
}

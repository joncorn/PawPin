//
//  LogInViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
  
  // MARK: - Outlets
  
  // views
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var passwordView: UIView!
  
  // text fields
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupElements()
    setupTextFields()
    setupTapGesture()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    errorLabel.alpha = 0
  }
  
  // MARK: - Actions
  @IBAction func logInButtonTapped(_ sender: Any) {
    let error = validateFields()
    if error != nil {
      showError(error!)
    } else {
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      // MARK:  Signing in user
      Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
        if error != nil {
          self.errorLabel.text = error!.localizedDescription
          self.errorLabel.alpha = 1
        } else {
          self.performSegue(withIdentifier: Constants.Storyboard.Segues.toHomeScreen, sender: self)
        }
      }
    }
  }
  
  // MARK: - Methods
  
  // MARK:  Show error
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  // MARK:  ValidateFields
  func validateFields() -> String? {
    if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
      passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
      return "Please fill in both fields"
    }
    
    let cleanedEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    if LoginUtility.isEmailValid(cleanedEmail) == false {
      return "Please enter a valid email"
    }
    
    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    if LoginUtility.isPasswordValid(cleanedPassword) == false {
      return "Please make sure your password is at least 8 characters, and contains a number and a special character"
    }
    return nil
  }
  
  // MARK:  Setup elements
  func setupElements() {
    //  Hide error label
    errorLabel.alpha = 0
    //  Stylize elements
    emailView.layer.cornerRadius = 10
    passwordView.layer.cornerRadius = 10
    loginButton.layer.cornerRadius = 10
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
}

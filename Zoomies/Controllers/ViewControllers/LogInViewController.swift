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
  
  //  MARK: - Outlets -
  //  Views
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var passwordView: UIView!
  //  Text fields
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  //  Login button, erro label
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    //  Delegates
    emailTextField.delegate = self
    passwordTextField.delegate = self
    //  UI
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //  Make error label invisible
    errorLabel.alpha = 0
    //  Reset text fields
    emailTextField.text = ""
    passwordTextField.text = ""
  }
  
  //  MARK: - Actions -
  @IBAction func logInButtonTapped(_ sender: Any) {
    let error = validateFields()
    if error != nil {
      showError(error!)
    } else {
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      //  MARK:  Signing in user
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
  
  //  MARK: - Methods -
  func setupUI() {
    setupViews()
    setupKeyboard()
  }
  
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  func validateFields() -> String? {
    //  Validate text fields and returns error string for errorLabel
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
  
  func setupViews() {
    //  Hide error label
    errorLabel.alpha = 0
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(emailView)
    StyleGuide.styleViewsCornerRadius(passwordView)
    StyleGuide.styleViewsCornerRadius(loginButton)
  }
  
  func setupKeyboard() {
    setupTextFields()
    setupTapGesture()
  }
  
  func setupTextFields() {
    let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))

    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()

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
  
} //  Class end

//  MARK: - UITextFieldDelegate -
extension LogInViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //  On return, begins editing next text field
    if textField == emailTextField {
      passwordTextField.becomeFirstResponder()
    } else {
      passwordTextField.resignFirstResponder()
    }
    return true
  }
  
} //  Ext. end

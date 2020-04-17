//
//  SignUpEmailPassViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/31/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class SignUpEmailPassViewController: UIViewController {
  
  //  MARK: - Properties -
  var firstNameLanding: String?
  var lastNameLanding: String?
  
  //  MARK: - Outlets -
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var passwordView: UIView!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var submitButton: UIButton!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    emailTextField.delegate = self
    passwordTextField.delegate = self
    
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    errorLabel.alpha = 0
    emailTextField.text = ""
    passwordTextField.text = ""
  }
  
  //  MARK: - Actions -
  @IBAction func submitButtonTapped(_ sender: Any) {
    //  If first and last name's are nil, don't create user
    guard let firstName = firstNameLanding,
      let lastName = lastNameLanding else { return }
    
    //  Validate fields
    let error = SignupUtility().validateEmailPass(email: emailTextField, password: passwordTextField)
    if error != nil {
      showError(error!)
    } else {
      
      //  If there's no error, grab what's in the text fields..
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      //  MARK: Create user
      FirebaseNetworking.createUser(firstName: firstName, lastName: lastName, email: email, password: password, errorLabel: errorLabel) { (error) in
        if !error {
          print("There was an error.")
        } else {
          self.performSegue(withIdentifier: Constants.Storyboard.Segues.toDogInfo, sender: self)
        }
      }
    }
  }
  
  //  MARK: - Methods -
  func setupUI () {
    setupViews()
    setupKeyboard()
  }
  
  func setupViews() {
    errorLabel.alpha = 0
    StyleGuide.styleViewsCornerRadius(emailView)
    StyleGuide.styleViewsCornerRadius(passwordView)
    StyleGuide.styleViewsCornerRadius(submitButton)
  }
  
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
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
extension SignUpEmailPassViewController: UITextFieldDelegate {
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

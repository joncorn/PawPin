//
//  ForgotPasswordViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
  
  // MARK: - PROPERTIES
  let activityIndicator = UIActivityIndicatorView(style: .medium)
  
  // MARK: - OUTLETS
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var sendButton: UIButton!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupElements()
  }
  
  // MARK: - ACTIONS
  @IBAction func sendButtonTapped(_ sender: Any) {
    
    // validate email
//    let error = SignupUtility().validateEmail(email: emailTextField)
//    if error != nil {
//      showError(error!)
//    } else { return }
    
    guard let email = emailTextField.text, email != "" else {
      self.showError("Enter your email")
      return
    }
    
    let error = SignupUtility().validateEmail(email: email)
    if error != nil {
      showError(error!)
      return
    }
    
    // password reset call
    FirebaseNetworking.resetPassword(email: email, onSuccess: {
      self.view.endEditing(true)
      self.performSegue(withIdentifier: "toEmailSentVC", sender: self)
    }) { (error) in
      self.showError("Please enter a valid email")
    }
  }
  
  @IBAction func backToLoginButtonTapped(_ sender: Any) {
    self.popBack(2)
  }
  
  
  // MARK: - METHODS
  
  func setupElements() {
    //  Hide error label
    errorLabel.alpha = 0
    //  Stylize elements
    emailView.layer.cornerRadius = 10
    sendButton.layer.cornerRadius = 10
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
    
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
}

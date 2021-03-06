//
//  ForgotPasswordViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
  
  //  MARK: - Properties
  let activityIndicator = UIActivityIndicatorView(style: .medium)
  
  //  MARK: - Outlets
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var sendButton: UIButton!
  
  //  MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //  Delegate
    emailTextField.delegate = self
    //  UI
    setupUI()
  }
  
  //  MARK: - Actions
  @IBAction func sendButtonTapped(_ sender: Any) {
    guard let email = emailTextField.text, email != "" else {
      self.showError("Enter your email")
      return
    }
    let error = SignupUtility().validateEmail(email: email)
    if error != nil {
      showError(error!)
      return
    }
    
    //  MARK:  Reset Password
    FirebaseNetworking.resetPassword(email: email, onSuccess: {
      self.view.endEditing(true)
      self.performSegue(withIdentifier: "toEmailSentVC", sender: self)
    }) { (error) in
      self.showError("Please enter a valid email")
    }
  }
  
  @IBAction func backToLoginButtonTapped(_ sender: Any) {
    //  Pop back to specific view on stack
    self.popBack(2)
  }
  
  //  MARK: - Methods
  func setupUI() {
    setupViews()
    setupKeyboard()
  }
  
  func setupViews() {
    //  Hide error label
    errorLabel.alpha = 0
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(emailView)
    StyleGuide.styleViewsCornerRadius(sendButton)
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
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
} //  Class end

//  MARK: - UITextFieldDelegate
extension ForgotPasswordViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //  Dismiss keyboard when return is pressed
    self.view.endEditing(true)
    return false
  }
  
} //  Ext. end

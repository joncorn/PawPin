//
//  SignUpViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  // MARK: - Outlets
  // Views
  @IBOutlet weak var lastNameView: UIView!
  @IBOutlet weak var firstNameView: UIView!
  
  // Text Fields
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    
    setupElements()
    setupTextFields()
    setupTapGesture()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    errorLabel.alpha = 0
  }
  
  // MARK: - ACTIONS
  @IBAction func nextButtonTapped(_ sender: Any) {
    
    let error = SignupUtility().validateName(firstName: firstNameTextField, lastName: lastNameTextField)
    if error != nil {
      showError(error!)
      return
    }
    
    self.performSegue(withIdentifier: "toEmailPassVC", sender: self)
  }
  
  
  
  // MARK: - Methods
  func setupElements() {
    // Error label
    errorLabel.alpha = 0
    // Setup views
    firstNameView.layer.cornerRadius = 10
    lastNameView.layer.cornerRadius = 10
    signUpButton.layer.cornerRadius = 10
  }
  
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  func setupTextFields() {
    
    let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
    
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    
    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    
    firstNameTextField.inputAccessoryView = toolbar
    lastNameTextField.inputAccessoryView = toolbar
    
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
  // MARK: - SEGUE
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "toEmailPassVC" {
      
      guard let destinationVC = segue.destination as? SignUpEmailPassViewController,
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        else { return }
      
      destinationVC.firstNameLanding = firstName
      destinationVC.lastNameLanding = lastName
    }
  }
}

// MARK: - TextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
  
}

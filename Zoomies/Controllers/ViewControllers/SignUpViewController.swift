//
//  SignUpViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
  
  //  MARK: - Outlets -
  @IBOutlet weak var lastNameView: UIView!
  @IBOutlet weak var firstNameView: UIView!
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    errorLabel.alpha = 0
    firstNameTextField.text = ""
    lastNameTextField.text = ""
  }
  
  //  MARK: - Actions -
  @IBAction func nextButtonTapped(_ sender: Any) {
    //  Check if text fields are valid, show error if not
    let error = SignupUtility().validateName(firstName: firstNameTextField, lastName: lastNameTextField)
    if error != nil {
      showError(error!)
      return
    }
    self.performSegue(withIdentifier: "toEmailPassVC", sender: self)
  }
  
  //  MARK: - Methods -
  func setupUI() {
    setupViews()
    setupKeyboard()
  }
  
  func setupViews() {
    errorLabel.alpha = 0
    StyleGuide.styleViewsCornerRadius(firstNameView)
    StyleGuide.styleViewsCornerRadius(lastNameView)
    StyleGuide.styleViewsCornerRadius(signUpButton)
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
    
    firstNameTextField.inputAccessoryView = toolbar
    lastNameTextField.inputAccessoryView = toolbar
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    //  Dismiss keyboard when user taps screen
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
  //  MARK: - PrepareForSegue -
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toEmailPassVC" {
      guard let destinationVC = segue.destination as? SignUpEmailPassViewController,
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        else { return }
      /// First and last name properties are used on the next page along with email and password for user creation
      destinationVC.firstNameLanding = firstName
      destinationVC.lastNameLanding = lastName
    }
  }
  
} //  Class end

//  MARK: - TextFieldDelegate -
extension SignUpViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //  On return, begins editing next text field
    if textField == firstNameTextField {
      lastNameTextField.becomeFirstResponder()
    } else {
      lastNameTextField.resignFirstResponder()
    }
    return true
  }
  
} //  Ext. end

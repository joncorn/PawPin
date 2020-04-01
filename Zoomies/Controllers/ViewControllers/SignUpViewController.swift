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
    
    setupElements()
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

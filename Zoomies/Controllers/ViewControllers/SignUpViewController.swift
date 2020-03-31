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
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupElements()
  }
  
  // MARK: - Methods
  func setupElements() {
    // Setup views
    firstNameView.layer.cornerRadius = 10
    lastNameView.layer.cornerRadius = 10
    signUpButton.layer.cornerRadius = 10
  }
  
  // MARK: - SEGUE
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toEmailPassVC" {
      
      guard let destinationVC = segue.destination as? SignUpEmailPassViewController,
        let firstName = firstNameTextField.text, !firstName.isEmpty,
        let lastName = lastNameTextField.text, !lastName.isEmpty
        else { return }
      
      destinationVC.firstNameLanding = firstName
      destinationVC.lastNameLanding = lastName
    }
  }
}

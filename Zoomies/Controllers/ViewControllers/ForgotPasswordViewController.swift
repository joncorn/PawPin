//
//  ForgotPasswordViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var submitButton: UIButton!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupElements()
  }
  
  // MARK: - Actions
  @IBAction func backToLoginButtonTapped(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }
  
  
  // MARK: - Methods
  func setupElements() {
    //  Hide error label
    errorLabel.alpha = 0
    //  Stylize elements
    emailView.layer.cornerRadius = 10
    submitButton.layer.cornerRadius = 10
  }
  
}

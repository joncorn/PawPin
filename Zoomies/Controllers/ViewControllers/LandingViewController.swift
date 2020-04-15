//
//  LandingViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
  
  // MARK: - Outlets
  // Buttons
  @IBOutlet weak var SignUpButton: UIButton!
  @IBOutlet weak var LogInButton: UIButton!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // UI
    setupButtons()
  }
  
  // MARK: - Methods
  func setupButtons() {
    // Round corners
    StyleGuide.styleLoginSignupButton(SignUpButton)
    StyleGuide.styleLoginSignupButton(LogInButton)
  }
  
} // Class end

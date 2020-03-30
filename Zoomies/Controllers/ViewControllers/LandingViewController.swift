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
  @IBOutlet weak var SignUpButton: UIButton!
  @IBOutlet weak var LogInButton: UIButton!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupButtons()
  }
  
  // MARK: - Methods
  
  func setupButtons() {
    // 73 is the height of the buttons
    SignUpButton.layer.cornerRadius = 73 / 2
    LogInButton.layer.cornerRadius = 73 / 2
  }
}

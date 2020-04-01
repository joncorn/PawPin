//
//  PasswordResetSentViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/31/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class PasswordResetSentViewController: UIViewController {
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - ACTIONS
  @IBAction func backToLoginButtonTapped(_ sender: Any) {
    self.popBack(3)
  }
  
}

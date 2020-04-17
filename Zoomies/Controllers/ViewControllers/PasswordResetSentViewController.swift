//
//  PasswordResetSentViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/31/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class PasswordResetSentViewController: UIViewController {
  
  //  MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //  MARK: - Actions
  @IBAction func backToLoginButtonTapped(_ sender: Any) {
    //  Pop back to specific view
    self.popBack(3)
  }
  
} //  Class end

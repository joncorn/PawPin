//
//  UploadDogPicViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class UploadDogPicViewController: UIViewController {
  
  // MARK: - PROPERTIES
  
  
  
  // MARK: - OUTLETS
  @IBOutlet weak var DogPicImageView: UIImageView!
  @IBOutlet weak var submitButton: UIButton!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - ACTIONS
  @IBAction func nextButtonTapped(_ sender: Any) {
    
    // Validate picture?
    
    // Upload picture to firebase
    
    // Segue to home screen
    self.performSegue(withIdentifier: Constants.Storyboard.Segues.toHomeScreen, sender: self)
  }
  
}

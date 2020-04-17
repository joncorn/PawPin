//
//  UploadDogPicViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class UploadDogPicViewController: UIViewController {
  
  //  MARK: - Outlets -
  @IBOutlet weak var DogPicImageView: UIImageView!
  @IBOutlet weak var submitButton: UIButton!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //  MARK: - Actions -
  @IBAction func nextButtonTapped(_ sender: Any) {
    
    //  Validate picture?
    
    //  Upload picture to firebase
    
    //  Segue to home screen
    self.performSegue(withIdentifier: Constants.Storyboard.Segues.toHomeScreen, sender: self)
  }
  
} //  Class end

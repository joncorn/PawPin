//
//  ProfileViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  // MARK: - OUTLETS
  
  // Status bar
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusTextField: UITextField!
  
  // Dogs collection view
  @IBOutlet weak var dogsCollectionView: UICollectionView!
  
  // Buttons
  @IBOutlet weak var editButton: UIButton!
  @IBOutlet weak var settingsButton: UIButton!
  
  

  // MARK: - VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  // MARK: - ACTIONS
  
  
  // MARK: - METHODS
}

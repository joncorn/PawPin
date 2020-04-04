//
//  ProfileDogCollectionViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/4/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ProfileDogCollectionViewCell: UICollectionViewCell {
  
  // MARK: - OUTLETS
  
  // Label
  @IBOutlet weak var dogNameLabel: UILabel!
  
  // Image
  @IBOutlet weak var dogImageView: UIImageView!
  
  // MARK: - METHODS
  func setupElements() {
    dogImageView.layer.cornerRadius = 10
  }
  
}

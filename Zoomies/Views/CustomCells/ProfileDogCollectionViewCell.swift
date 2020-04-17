//
//  ProfileDogCollectionViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/4/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ProfileDogCollectionViewCell: UICollectionViewCell {
  
  //  MARK: - Outlets -
  @IBOutlet weak var dogNameLabel: UILabel!
  @IBOutlet weak var dogImageView: UIImageView!
  
  //  MARK: - Methods -
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(dogImageView)
  }
  
} //  Class end

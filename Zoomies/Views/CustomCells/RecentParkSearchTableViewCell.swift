//
//  RecentParkSearchTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class RecentParkSearchTableViewCell: UITableViewCell {

  //  MARK: - Outlets -
  @IBOutlet weak var parkImageView: UIImageView!
  @IBOutlet weak var parkDetailsView: UIView!
  
  //  MARK: - Methods -
  func SetupViews() {
    StyleGuide.styleViewsCornerRadius(parkImageView)
    StyleGuide.styleViewsCornerRadius(parkDetailsView)
    parkDetailsView.dropShadow()
  }
  
} //  Class end

//
//  parkLocationsSearchTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/5/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class parkLocationsSearchTableViewCell: UITableViewCell {

  //  MARK: - Outlets -
  @IBOutlet weak var parkImageView: UIImageView!
  @IBOutlet weak var parkDetailsView: UIView!
  @IBOutlet weak var parkNameLabel: UILabel!
  @IBOutlet weak var parkLocationLabel: UILabel!
  
  //  MARK: - Methods -
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(parkImageView)
    StyleGuide.styleViewsCornerRadius(parkDetailsView)
    parkDetailsView.dropShadow()
  }
  
} //  Class end

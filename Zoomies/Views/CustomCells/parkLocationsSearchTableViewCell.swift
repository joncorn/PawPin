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
  //  Image
  @IBOutlet weak var parkImageView: UIImageView!
  //  View
  @IBOutlet weak var parkDetailsView: UIView!
  //  Labels
  @IBOutlet weak var parkNameLabel: UILabel!
  @IBOutlet weak var parkLocationLabel: UILabel!
  
  //  MARK: - Methods -
  func setupViews() {
    //  Stylize views
    StyleGuide.styleViewsCornerRadius(parkImageView)
    StyleGuide.styleViewsCornerRadius(parkDetailsView)
    //  Drop shadow
    parkDetailsView.dropShadow()
  }
  
} //  Class end

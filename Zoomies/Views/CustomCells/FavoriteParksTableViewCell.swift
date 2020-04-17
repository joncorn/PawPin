//
//  LikedParksTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class FavoriteParksTableViewCell: UITableViewCell {

  //  MARK: - Outlets -
  @IBOutlet weak var parkNameLabel: UILabel!
  @IBOutlet weak var parkLocationLabel: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  @IBOutlet weak var parkImageView: UIImageView!
  @IBOutlet weak var parkDetailsView: UIView!
  
  //  MARK: - Methods -
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(parkImageView)
    StyleGuide.styleViewsCornerRadius(parkDetailsView)
    parkDetailsView.dropShadow()
  }

} //  Class end

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
  //  Labels
  @IBOutlet weak var parkNameLabel: UILabel!
  @IBOutlet weak var parkLocationLabel: UILabel!
  //  Favorite button
  @IBOutlet weak var favoriteButton: UIButton!
  //  Park image
  @IBOutlet weak var parkImageView: UIImageView!
  //  Park details view
  @IBOutlet weak var parkDetailsView: UIView!
  
  //  MARK: - Methods -
  func setupViews() {
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(parkImageView)
    StyleGuide.styleViewsCornerRadius(parkDetailsView)
    //  Drop shadow on parkDetailView
    parkDetailsView.dropShadow()
  }

} //  Class end

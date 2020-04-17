//
//  ConnectLikedFriendsTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/4/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ConnectLikedFriendsTableViewCell: UITableViewCell {

  //  MARK: - Outlets -
  //  Views
  @IBOutlet weak var friendDetailView: UIView!
  @IBOutlet weak var friendDogImageView: UIImageView!
  //  Labels
  @IBOutlet weak var friendNameLabel: UILabel!
  @IBOutlet weak var friendDogNameLabel: UILabel!
  //  Buttons
  @IBOutlet weak var likedButton: UIButton!
  
  //  MARK: - Methods -
  func setupViews() {
    //  Stylize views
    StyleGuide.styleViewsCornerRadius(friendDetailView)
    StyleGuide.styleViewsCornerRadius(friendDogImageView)
    //  Drop shadow
    friendDetailView.dropShadow()
  }
  
} //  Class end

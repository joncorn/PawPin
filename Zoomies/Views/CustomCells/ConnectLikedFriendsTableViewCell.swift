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
  @IBOutlet weak var friendDetailView: UIView!
  @IBOutlet weak var friendDogImageView: UIImageView!
  @IBOutlet weak var friendNameLabel: UILabel!
  @IBOutlet weak var friendDogNameLabel: UILabel!
  @IBOutlet weak var likedButton: UIButton!
  
  //  MARK: - Methods -
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(friendDetailView)
    StyleGuide.styleViewsCornerRadius(friendDogImageView)
    friendDetailView.dropShadow()
  }
  
} //  Class end

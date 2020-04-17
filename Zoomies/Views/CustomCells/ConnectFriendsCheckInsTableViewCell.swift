//
//  ConnectFriendsCheckInsTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/4/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ConnectFriendsCheckInsTableViewCell: UITableViewCell {
  
  //  MARK: - Outlets -
  //  Views
  @IBOutlet weak var friendDogImageView: UIImageView!
  @IBOutlet weak var checkInDetailView: UIView!
  //  Labels
  @IBOutlet weak var friendDogNameLabel: UILabel!
  @IBOutlet weak var checkInLocationLabel: UILabel!
  @IBOutlet weak var checkInTimeLabel: UILabel!
  
  //  MARK: - Methods -
  func setupViews() {
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(friendDogImageView)
    StyleGuide.styleViewsCornerRadius(checkInDetailView)
    //  Drop shadow
    checkInDetailView.dropShadow()
  }
  
} //  Class end

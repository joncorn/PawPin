//
//  ConnectLikedFriendsTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/4/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ConnectLikedFriendsTableViewCell: UITableViewCell {

  // MARK: - OUTLETS
  
  // Views
  @IBOutlet weak var friendDetailView: UIView!
  @IBOutlet weak var friendDogImageView: UIImageView!
  
  // Labels
  @IBOutlet weak var friendNameLabel: UILabel!
  @IBOutlet weak var friendDogNameLabel: UILabel!
  
  // Buttons
  @IBOutlet weak var likedButton: UIButton!
  
  // MARK: - METHODS
  func setupElements() {
    friendDetailView.layer.cornerRadius = 10
    friendDogImageView.layer.cornerRadius = 10
    
    friendDetailView.dropShadow()
  }
  
}

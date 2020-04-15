//
//  RecentParkSearchTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class RecentParkSearchTableViewCell: UITableViewCell {

  // MARK: - OUTLETS
  
  // Image
  @IBOutlet weak var parkImageView: UIImageView!
  
  // View
  @IBOutlet weak var parkDetailsView: UIView!
  
  // MARK: - METHODS
  func setupElements() {
    
    // Stylize views
    StyleGuide.styleViewsCornerRadius(parkImageView)
    StyleGuide.styleViewsCornerRadius(parkDetailsView)
    
    // Drop shadow on park detail view
    parkDetailsView.dropShadow()
  }
  
}

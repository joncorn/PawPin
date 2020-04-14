//
//  parkLocationsSearchTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/5/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class parkLocationsSearchTableViewCell: UITableViewCell {

  // MARK: - OUTLETS
  
  // Image
  @IBOutlet weak var parkImageView: UIImageView!
  
  // View
  @IBOutlet weak var parkDetailsView: UIView!
  
  // Labels
  @IBOutlet weak var parkNameLabel: UILabel!
  @IBOutlet weak var parkLocationLabel: UILabel!
  
  // MARK: - METHODS
  func setupElements() {
    parkImageView.layer.cornerRadius = 10
    parkDetailsView.layer.cornerRadius = 10
    
    parkDetailsView.dropShadow()
  }
  
}

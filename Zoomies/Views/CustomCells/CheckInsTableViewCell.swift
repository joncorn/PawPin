//
//  CheckInsTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class CheckInsTableViewCell: UITableViewCell {

  // MARK: - OUTLETS
  @IBOutlet weak var checkInView: UIView!
  
  @IBOutlet weak var checkInDateLabel: UILabel!
  @IBOutlet weak var checkInTimeLabel: UIView!
  @IBOutlet weak var parkNameLabel: UIView!
  
  // MARK: - METHODS
  func setupElements() {
    checkInView.layer.cornerRadius = 10
    
    checkInView.dropShadow()
  }
  
}

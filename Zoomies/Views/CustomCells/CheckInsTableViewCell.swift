//
//  CheckInsTableViewCell.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class CheckInsTableViewCell: UITableViewCell {

  //  MARK: - Outlets -
  @IBOutlet weak var checkInView: UIView!
  @IBOutlet weak var checkInDateLabel: UILabel!
  @IBOutlet weak var checkInTimeLabel: UIView!
  @IBOutlet weak var parkNameLabel: UIView!
  
  //  MARK: - Methods -
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(checkInView)
    checkInView.dropShadow()
  }
  
} //  Class end

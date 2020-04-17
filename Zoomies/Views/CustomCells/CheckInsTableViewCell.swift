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
  //  Views
  @IBOutlet weak var checkInView: UIView!
  //  Labels
  @IBOutlet weak var checkInDateLabel: UILabel!
  @IBOutlet weak var checkInTimeLabel: UIView!
  @IBOutlet weak var parkNameLabel: UIView!
  
  //  MARK: - Methods -
  func setupViews() {
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(checkInView)
    //  Drop shadow
    checkInView.dropShadow()
  }
  
} //  Class end

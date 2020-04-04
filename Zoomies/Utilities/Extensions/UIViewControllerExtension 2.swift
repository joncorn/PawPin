//
//  UIViewControllerExtension.swift
//  Zoomies
//
//  Created by Jon Corn on 3/31/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

extension UIViewController {
  
  func popBack(_ nb: Int) {
    if let viewControllers: [UIViewController] = self.navigationController?.viewControllers {
      guard viewControllers.count < nb else {
        self.navigationController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
        return
      }
    }
  }
}

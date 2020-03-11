//
//  Dog.swift
//  Zoomies
//
//  Created by Jon Corn on 3/11/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import Foundation
import UIKit.UIImage

class Dog {
  
  // MARK:  Properties
  var name: String
  var size: String
  var breed: String
  var owner: String
  var status: String
  var image: [DogPic]
  
  struct DogPic {
    var image: UIImage
  }
  
  // MARK:  Initializer
  init(name: String, size: String, breed: String, status: String, image: [DogPic] = [], owner: String) {
    self.name = name
    self.size = size
    self.breed = breed
    self.status = status
    self.image = image
    self.owner = owner
  }
  
}

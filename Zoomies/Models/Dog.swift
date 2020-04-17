//
//  Dog.swift
//  Zoomies
//
//  Created by Jon Corn on 3/11/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class Dog {
  
  //  MARK: - Properties -
  var name: String
  var size: [DogSize]
  var breed: String
  var owner: String
  var status: String
  var image: [DogPic]
  
  struct DogPic {
    var image: UIImage
  }
  
  struct DogSize {
    var small: Bool = false
    var medium: Bool = false
    var Large: Bool = false
  }
  
  //  MARK: - Initializer -
  init(name: String, size: [DogSize], breed: String, status: String, image: [DogPic] = [], owner: String) {
    self.name = name
    self.size = size
    self.breed = breed
    self.status = status
    self.image = image
    self.owner = owner
  }
  
}

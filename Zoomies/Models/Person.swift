//
//  Person.swift
//  Zoomies
//
//  Created by Jon Corn on 3/11/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import Foundation

class Person {
  
  //  MARK: - Properites -
  var firstName: String
  var lastName: String
  var status: String
  var checkIns: [CheckIn]
  var dogParks: [DogPark]
  var dogs: [Dog]
  
  //  MARK: - Initializer -
  init(firstName: String, lastName: String, status: String, checkIns: [CheckIn] = [], dogParks: [DogPark] = [], dogs: [Dog] = []) {
    self.firstName = firstName
    self.lastName = lastName
    self.status = status
    self.checkIns = checkIns
    self.dogParks = dogParks
    self.dogs = dogs
  }
}

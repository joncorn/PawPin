//
//  AboutDogViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/1/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class AboutDogViewController: UIViewController {
  
  // MARK: - OUTLETS
  
  // Dog breed text field
  @IBOutlet weak var breedView: UIView!
  @IBOutlet weak var breedTextField: UITextField!
  
  // Dog age text field
  @IBOutlet weak var ageView: UIView!
  @IBOutlet weak var ageTextField: UITextField!
  
  // Small size check box
  @IBOutlet weak var smallDogSizeView: UIView!
  @IBOutlet weak var smallCheckBoxButton: UIButton!
  
  // Medium size check box
  @IBOutlet weak var mediumDogSizeView: UIView!
  @IBOutlet weak var mediumCheckBoxButton: UIView!
  
  // Large size check box
  @IBOutlet weak var largeDogSizeView: UIView!
  @IBOutlet weak var largeCheckBoxButton: UIView!
  
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var nextButton: UIButton!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupElements()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    errorLabel.alpha = 0
  }
  
  // MARK: - ACTIONS
  @IBAction func nextButtonTapped(_ sender: Any) {
    
    // Checks if the text fields have a value, if not, show error
    let error = SignupUtility().validateBreedAge(dogBreed: breedTextField, dogAge: ageTextField)
    if error != nil {
      showError(error!)
      return
    }
  }
  
  // MARK: - METHODS
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  func setupElements() {
    errorLabel.alpha = 0
    
    breedView.layer.cornerRadius = 10
    ageView.layer.cornerRadius = 10
    smallDogSizeView.layer.cornerRadius = 10
    smallCheckBoxButton.layer.cornerRadius = 10
    mediumDogSizeView.layer.cornerRadius = 10
    mediumCheckBoxButton.layer.cornerRadius = 10
    largeDogSizeView.layer.cornerRadius = 10
    largeCheckBoxButton.layer.cornerRadius = 10
    nextButton.layer.cornerRadius = 10
  }
  
}

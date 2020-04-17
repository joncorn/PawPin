//
//  AboutDogViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/1/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class AboutDogViewController: UIViewController {
  
  //  MARK: - Outlets
  //  Dog breed text field
  @IBOutlet weak var breedView: UIView!
  @IBOutlet weak var breedTextField: UITextField!
  //  Dog age text field
  @IBOutlet weak var ageView: UIView!
  @IBOutlet weak var ageTextField: UITextField!
  //  Small size check box
  @IBOutlet weak var smallDogSizeView: UIView!
  @IBOutlet weak var smallCheckBoxButton: UIButton!
  //  Medium size check box
  @IBOutlet weak var mediumDogSizeView: UIView!
  @IBOutlet weak var mediumCheckBoxButton: UIButton!
  //  Large size check box
  @IBOutlet weak var largeDogSizeView: UIView!
  @IBOutlet weak var largeCheckBoxButton: UIButton!
  //  Button, error label
  @IBOutlet weak var errorLabel: UILabel!
  @IBOutlet weak var nextButton: UIButton!
  
  //  MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //  UI
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //  Make error label invisible
    errorLabel.alpha = 0
  }
  
  //  MARK: - Actions
  @IBAction func nextButtonTapped(_ sender: Any) {
    //  Checks if the text fields have a value, if not, show error
    let error = SignupUtility().validateBreedAge(dogBreed: breedTextField, dogAge: ageTextField)
    if error != nil {
      showError(error!)
      return
    }
    
    //  Upload info to firebase
    
    //  Segue to dog pic VC
    self.performSegue(withIdentifier: Constants.Storyboard.Segues.toDogPic, sender: self)
  }
  
  //  MARK: - Methods
  func setupUI() {
    setupViews()
    setupKeyboard()
  }
  
  func showError(_ message: String) {
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  func setupViews() {
    //  Hide error label
    errorLabel.alpha = 0
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(breedView)
    StyleGuide.styleViewsCornerRadius(ageView)
    StyleGuide.styleViewsCornerRadius(smallDogSizeView)
    StyleGuide.styleViewsCornerRadius(smallCheckBoxButton)
    StyleGuide.styleViewsCornerRadius(mediumDogSizeView)
    StyleGuide.styleViewsCornerRadius(mediumCheckBoxButton)
    StyleGuide.styleViewsCornerRadius(largeDogSizeView)
    StyleGuide.styleViewsCornerRadius(largeCheckBoxButton)
    StyleGuide.styleViewsCornerRadius(nextButton)
  }
  
  func setupKeyboard() {
    setupTextFields()
    setupTapGesture()
  }
  
  func setupTextFields() {
    let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    
    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    
    breedTextField.inputAccessoryView = toolbar
    ageTextField.inputAccessoryView = toolbar
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
} //  Class end

//  MARK: - UITestFieldDelegate
extension AboutDogViewController: UITextFieldDelegate {
  
} //  Ext. end

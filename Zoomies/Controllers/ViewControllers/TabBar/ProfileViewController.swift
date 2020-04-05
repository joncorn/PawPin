//
//  ProfileViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  // MARK: - OUTLETS
  
  // Status bar
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusTextField: UITextField!
  
  // Dogs collection view
  @IBOutlet weak var dogsCollectionView: UICollectionView!
  
  // Buttons
  @IBOutlet weak var editButton: UIButton!
  @IBOutlet weak var settingsButton: UIButton!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dogsCollectionView.delegate = self
    dogsCollectionView.dataSource = self
    
    setupElements()
    setupKeyboard()
  }
  
  // MARK: - ACTIONS
  
  
  // MARK: - METHODS
  func setupElements() {
    statusView.layer.cornerRadius = 10
  }
  
  func setupKeyboard() {
    setupTextFields()
    setupTapGesture()
    setupKeyboardObserver()
  }
  
  func setupTextFields() {
    
    // Create toolbar
    let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
    
    // Create left side empty space so that done button set on right side
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    // Create done button
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    
    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    
    // Add toolbar to keyboards
    statusTextField.inputAccessoryView = toolbar
    
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
  func setupKeyboardObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
      if self.view.frame.origin.y == 0 {
        self.view.frame.origin.y -= keyboardSize.height - 80
      }
    }
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    if self.view.frame.origin.y != 0 {
      self.view.frame.origin.y = 0
    }
  }
  
} // Class end

// MARK: - COLLECTIONVIEW DELEGATE
extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dogCell", for: indexPath)
      as? ProfileDogCollectionViewCell else { return UICollectionViewCell()}
    // Build cell
    
    cell.setupElements()
    
    return cell
  }
  
  
}

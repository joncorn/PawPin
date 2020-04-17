//
//  ProfileViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  //  MARK: - Outlets
  //  Status bar
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusTextField: UITextField!
  //  Dogs collection view
  @IBOutlet weak var dogsCollectionView: UICollectionView!
  //  Buttons
  @IBOutlet weak var editButton: UIButton!
  @IBOutlet weak var settingsButton: UIButton!
  
  //  MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    //  DataSource/Delegate
    dogsCollectionView.delegate = self
    dogsCollectionView.dataSource = self
    //  UI
    setupUI()
  }
  
  //  MARK: - Methods
  func setupUI() {
    setupViews()
    setupKeyboard()
  }
  
  func setupViews() {
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(statusView)
  }
  
  func setupKeyboard() {
    setupTextFields()
    setupTapGesture()
    setupKeyboardObserver()
  }
  
  func setupTextFields() {
    let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.size.width, height: 30)))
    let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
    
    toolbar.setItems([flexSpace, doneButton], animated: false)
    toolbar.sizeToFit()
    
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
  
} //  Class end

//  MARK: - CollectionViewDelegate
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
  
} //  Ext. end

//
//  HomeViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
  
  //  MARK: - Outlets -
  //  Views
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  //  Status text field
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusTextField: UITextField!
  //  Recent Check Ins
  @IBOutlet weak var checkInsTableView: UITableView!
  //  Favorite Parks
  @IBOutlet weak var favoriteParksTableView: UITableView!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    //  DataSource/Delegates
    favoriteParksTableView.delegate = self
    favoriteParksTableView.dataSource = self
    checkInsTableView.delegate = self
    checkInsTableView.dataSource = self
    //  UI
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //  Hide navbar
    hideNavigationBar(animated: animated)
    //  Reset tableviews positions
    checkInsTableView.setContentOffset(CGPoint.zero, animated: false)
    favoriteParksTableView.setContentOffset(CGPoint.zero, animated: false)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    //  Reset scrollview position
    scrollView.setContentOffset(CGPoint.zero, animated: true)
  }
  
  //  MARK: - Methods -
  func setupUI() {
    setupViews()
    setupKeyboard()
  }
  
  func setupViews() {
    //  Corner radius
    StyleGuide.styleViewsCornerRadius(statusView)
    StyleGuide.styleViewsCornerRadius(checkInsTableView)
    StyleGuide.styleViewsCornerRadius(favoriteParksTableView)
    StyleGuide.styleViewsCornerRadius(headerView)
    //  Seperator Style
    favoriteParksTableView.separatorStyle = .none
    checkInsTableView.separatorStyle = .none
    checkInsTableView.allowsSelection = false
    //  Header view
    headerView.dropShadowHeader()
  }
  
  func hideNavigationBar(animated: Bool) {
    //  Hide navigation bar after logging in
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
    
    statusTextField.inputAccessoryView = toolbar
  }
  
  @objc func doneButtonTapped() {
    self.view.endEditing(true)
  }
  
  func setupTapGesture() {
    let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tap)
  }
  
} //  Class end

//  MARK: - TableViewDelegate -
extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == favoriteParksTableView {
      tableView.deselectRow(at: indexPath, animated: true)
      performSegue(withIdentifier: Constants.Storyboard.Segues.toParkDetails, sender: self)
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == checkInsTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkInCell", for: indexPath) as? CheckInsTableViewCell
        else {return UITableViewCell()}
      // Setup cell
      cell.setupElements()
      return cell
    }
    
    if tableView == favoriteParksTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell", for: indexPath) as? FavoriteParksTableViewCell
        else { return UITableViewCell()}
      // Setup cell
      cell.setupElements()
      return cell
    }
    
    return UITableViewCell()
  }
  
  // MARK: - Prepare for segue -
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Constants.Storyboard.Segues.toParkDetails {
      guard let destinationVC = segue.destination as? ParkDetailsViewController,
        let indexPath = favoriteParksTableView.indexPathForSelectedRow else {return}
      
      // let park = parkindex
      // throw data to landing
    }
  }
  
} //  Ext. end

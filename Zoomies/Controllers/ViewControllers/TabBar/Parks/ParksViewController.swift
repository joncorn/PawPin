//
//  ParksViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ParksViewController: UIViewController {
  
  // MARK: - OUTLETS
  // Views
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  // Map button
  @IBOutlet weak var parkMapImageView: UIImageView!
  // Header buttons
  @IBOutlet weak var recentParkSearchButton: UIButton!
  @IBOutlet weak var favoriteParksButton: UIButton!
  // Tableviews
  @IBOutlet weak var recentParkSearchTableView: UITableView!
  @IBOutlet weak var favoriteParksTableView: UITableView!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    // DataSource/Delegates
    recentParkSearchTableView.delegate = self
    recentParkSearchTableView.dataSource = self
    favoriteParksTableView.delegate = self
    favoriteParksTableView.dataSource = self
    // UI
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // Reset scrollview position
    scrollView.setContentOffset(CGPoint.zero, animated: false)
    recentParkSearchTableView.setContentOffset(CGPoint.zero, animated: false)
    favoriteParksTableView.setContentOffset(CGPoint.zero, animated: false)
  }
  
  // MARK: - ACTIONS
  @IBAction func parkMapTapped(_ sender: UITapGestureRecognizer) {
    print("map")
    performSegue(withIdentifier: Constants.Storyboard.Segues.toParkMap, sender: self)
  }
  
  // MARK: - METHODS
  func setupUI() {
    setupElements()
    setupTableViews()
  }
  
  func setupElements() {
    // Corner radius
    StyleGuide.styleViewsCornerRadius(parkMapImageView)
    StyleGuide.styleViewsCornerRadius(recentParkSearchButton)
    StyleGuide.styleViewsCornerRadius(favoriteParksButton)
    // Allow action when image is tapped
    parkMapImageView.isUserInteractionEnabled = true
    // Drop shadow
    headerView.dropShadowHeader()
  }
  
  func setupTableViews() {
    // Corner radius
    StyleGuide.styleViewsCornerRadius(recentParkSearchTableView)
    StyleGuide.styleViewsCornerRadius(favoriteParksTableView)
    // Separator style
    recentParkSearchTableView.separatorStyle = .none
    favoriteParksTableView.separatorStyle = .none
  }
  
} // Class end

// MARK: - TABLEVIEW EXT.
extension ParksViewController: UITableViewDelegate, UITableViewDataSource {
  
  // MARK:  numberOfRowsInSection
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  // MARK:  didSelectRowAt
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == self.recentParkSearchTableView {
      tableView.deselectRow(at: indexPath, animated: true)
    }
    
    if tableView == self.favoriteParksTableView {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  // MARK:  cellForRowAt
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == self.recentParkSearchTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "recentParkCell", for: indexPath) as? RecentParkSearchTableViewCell else { return UITableViewCell()}
      // configure cell here
      
      cell.setupElements()
      
      return cell
    }

    if tableView == self.favoriteParksTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteParkCell", for: indexPath) as? FavoriteParksTableViewCell else { return UITableViewCell()}
      // configure cell here
      
      cell.setupElements()
      
      return cell
    }
    
    return UITableViewCell()
  }
  
}

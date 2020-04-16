//
//  LikedFriendsViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/15/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class LikedFriendsViewController: UIViewController {
  
  // MARK: - Outlets
  // View
  @IBOutlet weak var headerView: UIView!
  // Tableview
  @IBOutlet weak var likedFriendsTableView: UITableView!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // DataSource/Delegate
    likedFriendsTableView.dataSource = self
    likedFriendsTableView.delegate = self
    // UI
    setupUI()
  }
  
  // MARK: - Methods
  func setupUI() {
    // Corner radius
    StyleGuide.styleViewsCornerRadius(headerView)
    // Tableview
    likedFriendsTableView.separatorStyle = .none
    // Drop shadow
    headerView.dropShadowHeader()
  }
  
} // Class end

// MARK: - Tableview DataSource/Delegate
extension LikedFriendsViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? ConnectLikedFriendsTableViewCell else { return UITableViewCell()}
    // Setup cell
    cell.setupElements()
    return cell
  }
  
  
} // Ext. end

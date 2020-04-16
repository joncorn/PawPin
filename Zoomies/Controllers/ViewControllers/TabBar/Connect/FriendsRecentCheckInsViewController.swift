//
//  FriendsRecentCheckInsViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/15/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class FriendsRecentCheckInsViewController: UIViewController {
  
  // MARK: - Outlets
  // View
  @IBOutlet weak var headerView: UIView!
  // Tableview
  @IBOutlet weak var checkInsTableView: UITableView!
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // DataSource/Delegate
    checkInsTableView.dataSource = self
    checkInsTableView.delegate = self
    // UI
    setupUI()
  }
  
  // MARK: - Methods
  func setupUI() {
    // Corner radius
    StyleGuide.styleViewsCornerRadius(headerView)
    // Tableview
    checkInsTableView.separatorStyle = .none
    // Drop shadow
    headerView.dropShadowHeader()
  }
  
} // Class end

// MARK: - Tableview DataSource/Delegate
extension FriendsRecentCheckInsViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkInCell", for: indexPath) as? ConnectFriendsCheckInsTableViewCell else {return UITableViewCell()}
    // Create cell
    cell.setupElements()
    return cell
  }
  
} // Ext. end

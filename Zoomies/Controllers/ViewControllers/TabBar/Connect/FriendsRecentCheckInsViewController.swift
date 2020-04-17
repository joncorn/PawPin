//
//  FriendsRecentCheckInsViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/15/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class FriendsRecentCheckInsViewController: UIViewController {
  
  //  MARK: - Outlets -
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var checkInsTableView: UITableView!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkInsTableView.dataSource = self
    checkInsTableView.delegate = self
    
    setupUI()
  }
  
  //  MARK: - Methods -
  func setupUI() {
    StyleGuide.styleViewsCornerRadius(headerView)
    checkInsTableView.separatorStyle = .none
    headerView.dropShadowHeader()
  }
  
} //  Class end

//  MARK: - TableViewDelegate -
extension FriendsRecentCheckInsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20 //  Mock number
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkInCell", for: indexPath) as? ConnectFriendsCheckInsTableViewCell else {return UITableViewCell()}
    // Create cell
    cell.setupViews()
    return cell
  }
  
} //  Ext. end

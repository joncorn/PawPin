//
//  LikedFriendsViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/15/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class LikedFriendsViewController: UIViewController {
  
  //  MARK: - Outlets -
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var likedFriendsTableView: UITableView!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    likedFriendsTableView.dataSource = self
    likedFriendsTableView.delegate = self
    
    setupUI()
  }
  
  //  MARK: - Methods -
  func setupUI() {
    StyleGuide.styleViewsCornerRadius(headerView)
    likedFriendsTableView.separatorStyle = .none
    headerView.dropShadowHeader()
  }
  
} //  Class end

//  MARK: - TableViewDelegate -
extension LikedFriendsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20 //  Mock number
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? ConnectLikedFriendsTableViewCell else { return UITableViewCell()}
    //  Setup cell
    cell.setupViews()
    return cell
  }
  
} //  Ext. end

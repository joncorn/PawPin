//
//  ConnectViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
  
  // MARK: - OUTLETS
  
  // Header buttons
  @IBOutlet weak var likedFriendsButton: UIButton!
  @IBOutlet weak var friendsCheckInsButton: UIButton!
  
  // Table views
  @IBOutlet weak var likedFriendsTableView: UITableView!
  @IBOutlet weak var friendsRecentCheckInsTableView: UITableView!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    likedFriendsTableView.dataSource = self
    likedFriendsTableView.delegate = self
    friendsRecentCheckInsTableView.dataSource = self
    friendsRecentCheckInsTableView.delegate = self
    
    likedFriendsTableView.separatorStyle = .none
    friendsRecentCheckInsTableView.separatorStyle = .none
    
    setupElements()
  }
  
  // MARK: - METHODS
  func setupElements() {
    likedFriendsButton.layer.cornerRadius = 10
    friendsCheckInsButton.layer.cornerRadius = 10
  }
}

// MARK: - TABLEVIEWDELEGATE
extension ConnectViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    // MARK:  LikedFriends Tableview
    if tableView == likedFriendsTableView {
      return 3
    }

    // MARK:  RecentCheckIns Tableview
    if tableView == friendsRecentCheckInsTableView {
      return 5
    }
    
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // MARK:  LikedFriends Tableview
    if tableView == likedFriendsTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        as? ConnectLikedFriendsTableViewCell else { return UITableViewCell() }
      // Build cell
      
      cell.setupElements()
      
      return cell
    }
    
    // MARK:  RecentCheckIns Tableview
    if tableView == friendsRecentCheckInsTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkInCell", for: indexPath)
        as? ConnectFriendsCheckInsTableViewCell else { return UITableViewCell() }
      // Build cell
      
      cell.setupElements()
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  
}

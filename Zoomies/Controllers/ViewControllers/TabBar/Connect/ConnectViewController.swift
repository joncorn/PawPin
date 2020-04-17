//
//  ConnectViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
  
  //  MARK: - Outlets -
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var likedFriendsButton: UIButton!
  @IBOutlet weak var friendsCheckInsButton: UIButton!
  @IBOutlet weak var likedFriendsTableView: UITableView!
  @IBOutlet weak var friendsRecentCheckInsTableView: UITableView!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    likedFriendsTableView.dataSource = self
    likedFriendsTableView.delegate = self
    friendsRecentCheckInsTableView.dataSource = self
    friendsRecentCheckInsTableView.delegate = self
    
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //  Reset view positions
    scrollView.setContentOffset(CGPoint.zero, animated: false)
    likedFriendsTableView.setContentOffset(CGPoint.zero, animated: false)
    friendsRecentCheckInsTableView.setContentOffset(CGPoint.zero, animated: false)
  }
  
  //  MARK: - Methods -
  func setupUI() {
    setupViews()
    setupTableViews()
  }
  
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(likedFriendsButton)
    StyleGuide.styleViewsCornerRadius(friendsCheckInsButton)
    StyleGuide.styleViewsCornerRadius(friendsRecentCheckInsTableView)
    StyleGuide.styleViewsCornerRadius(likedFriendsTableView)
    StyleGuide.styleViewsCornerRadius(headerView)
    
    headerView.dropShadowHeader()
  }
  
  func setupTableViews() {
    likedFriendsTableView.separatorStyle = .none
    friendsRecentCheckInsTableView.separatorStyle = .none
  }
  
} //  Class end

//  MARK: - TableViewDelegate -
extension ConnectViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == likedFriendsTableView {
      return 3
    }
    if tableView == friendsRecentCheckInsTableView {
      return 5
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == likedFriendsTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        as? ConnectLikedFriendsTableViewCell else { return UITableViewCell() }
      //  Build cell
      cell.setupViews()
      return cell
    }
    
    if tableView == friendsRecentCheckInsTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "checkInCell", for: indexPath)
        as? ConnectFriendsCheckInsTableViewCell else { return UITableViewCell() }
      //  Build cell
      cell.setupViews()
      return cell
    }
    
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.likedFriendsTableView {
          tableView.deselectRow(at: indexPath, animated: true)
        }
        
        if tableView == self.friendsRecentCheckInsTableView {
          tableView.deselectRow(at: indexPath, animated: true)
        }
      }
  
} //  Ext. end

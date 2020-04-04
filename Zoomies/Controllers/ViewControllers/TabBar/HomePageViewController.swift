//
//  HomeViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 3/10/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
  
  // MARK: - OUTLETS
  
  // Status text field
  @IBOutlet weak var statusView: UIView!
  @IBOutlet weak var statusTextField: UITextField!
  
  // Recent Check Ins
  @IBOutlet weak var checkInsTableView: UITableView!
  
  // Favorite Parks
  @IBOutlet weak var favoriteParksTableView: UITableView!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    favoriteParksTableView.delegate = self
    favoriteParksTableView.dataSource = self
    checkInsTableView.delegate = self
    checkInsTableView.dataSource = self
    
    setupElements()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    hideNavigationBar(animated: animated)
  }
  
  
  // MARK: - METHODS
  
  func setupElements() {
    
    // Statusbar
    statusView.layer.cornerRadius = 10
    
    // TableViews
    favoriteParksTableView.separatorStyle = .none
    checkInsTableView.separatorStyle = .none
    checkInsTableView.allowsSelection = false
  }
  
  // Hide navigation bar after logging in
  func hideNavigationBar(animated: Bool) {
    self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }
}

// MARK: - TABLEVIEW EXT.
extension HomePageViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  // MARK:  didSelectRowAt
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == favoriteParksTableView {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  // MARK:  cellForRowAt
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
  
  
}

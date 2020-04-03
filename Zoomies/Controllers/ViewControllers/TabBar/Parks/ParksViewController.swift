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
  
  // Map image view
  @IBOutlet weak var dogParkMapImageView: UIImageView!
  
  // Views
  @IBOutlet weak var likedDogParksView: UIView!
  @IBOutlet weak var recentParkSearchView: UIView!
  
  // Tableviews
  @IBOutlet weak var recentParkSearchTableView: UITableView!
  @IBOutlet weak var likedParksTableView: UITableView!
  
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    recentParkSearchTableView.delegate = self
    recentParkSearchTableView.dataSource = self
    likedParksTableView.delegate = self
    likedParksTableView.dataSource = self
    
    setupUI()
  }
  
  // MARK: - ACTIONS
  
  
  // MARK: - METHODS
  func setupElements() {
    dogParkMapImageView.layer.cornerRadius = 10
    likedDogParksView.layer.cornerRadius = 10
    recentParkSearchView.layer.cornerRadius = 10
  }
  
  func setupTableViews() {
    recentParkSearchTableView.separatorStyle = .none
    likedParksTableView.separatorStyle = .none
  }
  
  func setupUI() {
    setupElements()
    setupTableViews()
  }
}

// MARK: - TABLEVIEW EXT.
extension ParksViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    guard let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell", for: indexPath) as? RecentParkSearchTableViewCell else { return UITableViewCell()}
    
//    var cell: UITableViewCell?

    if tableView == self.recentParkSearchTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell", for: indexPath) as? RecentParkSearchTableViewCell else { return UITableViewCell()}
      // configure cell here
      
      cell.setupElements()
      
      return cell
    }

    if tableView == self.likedParksTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "likedParkCell", for: indexPath) as? LikedParksTableViewCell else { return UITableViewCell()}
      // configure cell here
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  
}

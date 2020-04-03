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
  @IBOutlet weak var favoriteParksView: UIView!
  @IBOutlet weak var recentParkSearchView: UIView!
  
  // Tableviews
  @IBOutlet weak var recentParkSearchTableView: UITableView!
  @IBOutlet weak var favoriteParksTableView: UITableView!
  
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    recentParkSearchTableView.delegate = self
    recentParkSearchTableView.dataSource = self
    favoriteParksTableView.delegate = self
    favoriteParksTableView.dataSource = self
    
    setupUI()
  }
  
  // MARK: - ACTIONS
  @IBAction func recentlySearchedParksTapped(_ sender: Any) {
    print("Recent Parks")
  }
  
  @IBAction func favoriteParksTapped(_ sender: Any) {
    print("Favorite Parks")
  }
  
  // MARK: - METHODS
  func setupElements() {
    dogParkMapImageView.layer.cornerRadius = 10
    favoriteParksView.layer.cornerRadius = 10
    recentParkSearchView.layer.cornerRadius = 10
  }
  
  func setupTableViews() {
    recentParkSearchTableView.separatorStyle = .none
    favoriteParksTableView.separatorStyle = .none
    
  }
  
  func setupUI() {
    setupElements()
    setupTableViews()
  }
}

// MARK: - TABLEVIEW EXT.
extension ParksViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
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
      
      return cell
    }
    
    return UITableViewCell()
  }
  
  
}

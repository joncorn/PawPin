//
//  FavoriteParksViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/15/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class FavoriteParksViewController: UIViewController {
  
  // MARK: - Outlets -
  // Header
  @IBOutlet weak var favoriteParksButton: UIButton!
  // Tableview
  @IBOutlet weak var favoriteParksTableView: UITableView!
  
  // MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    // DataSource/Delegate
    favoriteParksTableView.delegate = self
    favoriteParksTableView.dataSource = self
    // UI
    setupUI()
  }
  
  // MARK: - Methods -
  func setupUI() {
    // Corner radius
    StyleGuide.styleViewsCornerRadius(favoriteParksTableView)
    StyleGuide.styleViewsCornerRadius(favoriteParksButton)
    // Tableview
    favoriteParksTableView.separatorStyle = .none
  }
  
} // Class end

// MARK: - TableviewDelegate -
extension FavoriteParksViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteParkCell", for: indexPath) as? FavoriteParksTableViewCell else {return UITableViewCell()}
    cell.setupViews()
    return cell
  }
  
} // ext. end

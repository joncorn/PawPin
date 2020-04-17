//
//  ParksViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/2/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class ParksViewController: UIViewController {
  
  //  MARK: - Outlets -
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var parkMapImageView: UIImageView!
  @IBOutlet weak var recentParkSearchButton: UIButton!
  @IBOutlet weak var favoriteParksButton: UIButton!
  @IBOutlet weak var recentParkSearchTableView: UITableView!
  @IBOutlet weak var favoriteParksTableView: UITableView!
  
  //  MARK: - View Lifecycle -
  override func viewDidLoad() {
    super.viewDidLoad()
    
    recentParkSearchTableView.delegate = self
    recentParkSearchTableView.dataSource = self
    favoriteParksTableView.delegate = self
    favoriteParksTableView.dataSource = self
    
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //  Reset view position
    scrollView.setContentOffset(CGPoint.zero, animated: false)
    recentParkSearchTableView.setContentOffset(CGPoint.zero, animated: false)
    favoriteParksTableView.setContentOffset(CGPoint.zero, animated: false)
  }
  
  //  MARK: - Actions -
  @IBAction func parkMapTapped(_ sender: UITapGestureRecognizer) {
    performSegue(withIdentifier: Constants.Storyboard.Segues.toParkMap, sender: self)
  }
  
  //  MARK: - Methods -
  func setupUI() {
    setupViews()
    setupTableViews()
  }
  
  func setupViews() {
    StyleGuide.styleViewsCornerRadius(parkMapImageView)
    StyleGuide.styleViewsCornerRadius(recentParkSearchButton)
    StyleGuide.styleViewsCornerRadius(favoriteParksButton)
    
    parkMapImageView.isUserInteractionEnabled = true
    
    headerView.dropShadowHeader()
  }
  
  func setupTableViews() {
    StyleGuide.styleViewsCornerRadius(recentParkSearchTableView)
    StyleGuide.styleViewsCornerRadius(favoriteParksTableView)
    StyleGuide.styleViewsCornerRadius(headerView)
    recentParkSearchTableView.separatorStyle = .none
    favoriteParksTableView.separatorStyle = .none
  }
  
} //  Class end

//  MARK: - TableViewDelegate -
extension ParksViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == self.recentParkSearchTableView {
      tableView.deselectRow(at: indexPath, animated: true)
    }
    
    if tableView == self.favoriteParksTableView {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == self.recentParkSearchTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "recentParkCell", for: indexPath) as? RecentParkSearchTableViewCell else { return UITableViewCell()}
      //  configure cell here
      cell.SetupViews()
      return cell
    }

    if tableView == self.favoriteParksTableView {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteParkCell", for: indexPath) as? FavoriteParksTableViewCell else { return UITableViewCell()}
      //  configure cell here
      cell.setupViews()
      return cell
    }
    
    return UITableViewCell()
  }
  
} //  Ext. end

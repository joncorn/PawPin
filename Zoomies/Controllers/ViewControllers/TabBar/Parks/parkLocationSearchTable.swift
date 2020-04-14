//
//  parkLocationSearchTable.swift
//  Zoomies
//
//  Created by Jon Corn on 4/5/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch: class {
  func dropPinZoomIn(_ placemark: MKPlacemark)
}

class parkLocationSearchTable: UITableViewController {
  
  // MARK: - PROPERTIES
  
  // Stashes search results
  var matchingItems: [MKMapItem] = []
  
  // Handle to the map from the previous view
  var parkMapView: MKMapView? = nil
  
  weak var delegate: HandleMapSearch?
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.separatorStyle = .none
  }
  
  // MARK: - METHODS
  func parseAddress(selectedItem: MKPlacemark) -> String {
    // Put space between "4" and "Melrose Place"
    let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
    // Put comma between street and city/state
    let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) ? ", " : ""
    // Put space between "Washington" and "DC"
    let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
    let addressLine = String(format: "%@%@%@%@%@%@%@",
                             // Street number
                             selectedItem.subThoroughfare ?? "",
                             firstSpace,
                             // Street name
                             selectedItem.thoroughfare ?? "",
                             comma,
                             // City
                             selectedItem.locality ?? "",
                             secondSpace,
                             // State
                             selectedItem.administrativeArea ?? ""
    )
    return addressLine
  }
  
} // Class end

// MARK: - SearchController delegate
extension parkLocationSearchTable: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    
    // Unwrap the optional values for mapview and the search bar text
    guard let mapView = parkMapView, let searchBarText = searchController.searchBar.text else { return }
    
    // A search request is comprised of a string and a map region
    // We get both from the above unwrapped properties
    let request = MKLocalSearch.Request()
    request.naturalLanguageQuery = searchBarText
    request.region = mapView.region
    
    // Performs the actual search on the request object
    let search = MKLocalSearch(request: request)
    // Seach.start executes the search query and returns a MKLocalSEarchResponse object which contain an array of mapitems
    search.start { (response, _) in
      guard let response = response else { return }
      // Stash these mapItems in matchingItems variable above
      self.matchingItems = response.mapItems
      self.tableView.reloadData()
    }
  }
  
} // Ext. end

// MARK: - TableView DataSource
extension parkLocationSearchTable {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return matchingItems.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath)
      as? parkLocationsSearchTableViewCell else { return UITableViewCell() }
    
    // Placemark is the name of the map item
    let selectedItem = matchingItems[indexPath.row].placemark
    
    cell.setupElements()
    cell.parkNameLabel.text = selectedItem.name
    cell.parkLocationLabel.text = parseAddress(selectedItem: selectedItem)
    
    return cell
  }
} // Ext. end

// MARK: - DidSelectRowAt
extension parkLocationSearchTable {
  // When result is selected, find correct placemark based on row number
  // Then pass placemark to map controller
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedItem = matchingItems[indexPath.row].placemark
    delegate?.dropPinZoomIn(selectedItem)
    dismiss(animated: true, completion: nil)
  }
}

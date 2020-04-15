//
//  ParkMapViewController.swift
//  Zoomies
//
//  Created by Jon Corn on 4/5/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit
import MapKit

class ParkMapViewController: UIViewController {
  
  // MARK: - PROPERTIES
  let locationManager = CLLocationManager()
  var resultSearchController: UISearchController? = nil
  // Using this to cache any incoming placemarks
  var selectedPin: MKPlacemark? = nil
  
  // MARK: - OUTLETS
  @IBOutlet weak var parkMapView: MKMapView!
  
  // MARK: - VIEW LIFECYCLE
  override func viewDidLoad() {
    super.viewDidLoad()

    locationManager.delegate = self
    
    setupLocationManager()
    setupSearchBar()
  }
  
  // MARK: - METHODS
  @objc func getDirections() {
    // API call that luanches the apple maps app with driving instructions
    // Converting selectedPin to a MKMapItem which is used to tell apple maps the location
    if let selectedPin = selectedPin {
      let mapItem = MKMapItem(placemark: selectedPin)
      let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
      mapItem.openInMaps(launchOptions: launchOptions)
    }
  }

  // Setup location manager
  func setupLocationManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()
  }
  
  // Setup search bar in nav bar
  func setupSearchBar() {
    
    // Points to our tableview where our results will show
    let parkLocationSearchTable = storyboard!.instantiateViewController(withIdentifier: "parkLocationSearchTable") as! parkLocationSearchTable
    // Set delegate here
    parkLocationSearchTable.delegate = self
    resultSearchController = UISearchController(searchResultsController: parkLocationSearchTable)
    resultSearchController?.searchResultsUpdater = parkLocationSearchTable
    
    // Configures search bar and embeds it within the nav bar
    let searchBar = resultSearchController!.searchBar
    searchBar.sizeToFit()
    searchBar.placeholder = "Search for parks"
    navigationItem.titleView = resultSearchController?.searchBar
    
    // Configures UISearchController appearance
    resultSearchController?.hidesNavigationBarDuringPresentation = false
    definesPresentationContext = true
    
    // Passes along a handle of the mapView from the main view controller onto the parkLocationSearchTable
    parkLocationSearchTable.parkMapView = parkMapView
    
  }
  
} // Class end


// MARK: - CLLocationManagerDelegate
extension ParkMapViewController: CLLocationManagerDelegate {
  
  // Gets called when the user responds to the permission dialog
  // If user chose allow, the status becomes CLAuthorizationStatus.AuthorizedWhenInUse
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    if status == .authorizedWhenInUse {
      locationManager.requestLocation()
    }
  }
  
  // Gets called when location info comes back. Gets an array of locations, but only interested in the first
  // Zooms in on the first location of the above array
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.first {
      print("location: \(location)")
      
      // Span is the "frame" W x H of the view of the map
      let span = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
      let region = MKCoordinateRegion(center: location.coordinate, span: span)
      parkMapView.setRegion(region, animated: true)
    }
  }
  
  // Print error (necessary function)
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("error: \(error)")
  }
} // Ext. end

// MARK: - HandleMapSearch Delegate
extension ParkMapViewController: HandleMapSearch {
  func dropPinZoomIn(_ placemark: MKPlacemark) {
    // Cache the pin
    selectedPin = placemark
    // Clear existing pins
    parkMapView.removeAnnotations(parkMapView.annotations)
    
    // Creates the message box above the pin
    let annotation = MKPointAnnotation()
    annotation.coordinate = placemark.coordinate
    annotation.title = placemark.name
    if let city = placemark.locality, let state = placemark.administrativeArea {
      annotation.subtitle = "\(city) \(state)"
    }
    
    // Adds annotation to mapview
    parkMapView.addAnnotation(annotation)
    let span = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
    let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
    parkMapView.setRegion(region, animated: true)
  }
  
  
}


// MARK: - MKMapViewDelegate
extension ParkMapViewController: MKMapViewDelegate {
  
  // Customizes the appearance of map pins and callouts
  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    // MKUserLocation is the blue pulsing dot
    // If the annotation is on the blue dot, just show the blue dot instead
    if annotation is MKUserLocation {
      return nil
    }
    
    // Pins are dequeued like tableview cells
    let reuseID = "pin"
    var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
    pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
    pinView?.pinTintColor = UIColor.green
    pinView?.canShowCallout = true
    
    // Sets size of button
    let smallSquare = CGSize(width: 30, height: 30)
    let button = UIButton(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: smallSquare))
    button.setBackgroundImage(UIImage(named: "bone"), for: .normal)
    button.addTarget(self, action: #selector(getDirections), for: .touchUpInside)
    // Adds button to the left side of the annotation box
    pinView?.leftCalloutAccessoryView = button
    
    return pinView
  }
}

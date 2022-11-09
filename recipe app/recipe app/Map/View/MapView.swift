//
//  MapView.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import UIKit
import MapKit

class MapView: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    var router = MapRouter()
    var viewModel = MapViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        // Set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        map.centerToLocation(initialLocation, regionRadius: CLLocationDistance(100))
        let restaurant = Restaurant(coordinate: CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444))
        map.addAnnotation(restaurant)
    }
    
}

class Restaurant: NSObject, MKAnnotation {
  let coordinate: CLLocationCoordinate2D

  init(
    coordinate: CLLocationCoordinate2D
  ) {
    self.coordinate = coordinate

    super.init()
  }
}

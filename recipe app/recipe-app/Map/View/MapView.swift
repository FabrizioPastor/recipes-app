//
//  MapView.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import UIKit
import MapKit

class MapView: UIViewController {

    deinit {
        print("Liberando MapView")
    }
    
    @IBOutlet weak var map: MKMapView!
    
    var router = MapRouter()
    var viewModel = MapViewModel()
    
    var coordenates = [Double]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        // Set initial location in Honolulu
        let initialLocation = CLLocation(latitude: coordenates.first ?? 0, longitude: coordenates.last ?? 0)
        map.centerToLocation(initialLocation, regionRadius: CLLocationDistance(1000))
        let restaurant = Restaurant(coordinate: CLLocationCoordinate2D(latitude: coordenates.first ?? 0, longitude: coordenates.last ?? 0))
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

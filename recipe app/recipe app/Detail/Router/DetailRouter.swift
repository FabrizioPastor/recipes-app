//
//  DetailRouter.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation
import UIKit

class DetailRouter {
    
    private var sourceView: DetailView?
    
    var viewController: DetailView {
        return DetailView()
    }
    
    func setSourceView(sourceView: DetailView?) {
        guard let sourceView = sourceView else { fatalError("DetailRouter: DetailView is nil") }
        self.sourceView  = sourceView
    }
    
    func navigateToMapView() {
        let mapView = MapRouter().viewController
        sourceView?.navigationController?.pushViewController(mapView, animated: true)
    }
    
}

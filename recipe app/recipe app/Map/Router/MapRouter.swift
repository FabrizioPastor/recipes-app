//
//  MapRouter.swift
//  recipe app
//
//  Created by FABRIZIO on 9/11/22.
//

import Foundation
import UIKit

class MapRouter {
    private var sourceView: MapView?
    
    var viewController: UIViewController {
        return MapView()
    }
    
    func setSouceView(sourceView: MapView) {
        self.sourceView = sourceView
    }
}

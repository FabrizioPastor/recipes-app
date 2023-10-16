//
//  MapViewModel.swift
//  recipe app
//
//  Created by FABRIZIO on 9/11/22.
//

import Foundation

class MapViewModel {
    
    private weak var view: MapView?
    private weak var router: MapRouter?
    
    func bind (view: MapView, router: MapRouter) {
        self.view = view
        self.router = router
        
        self.router?.setSouceView(sourceView: view)
    }
    
}

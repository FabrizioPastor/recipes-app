//
//  HomeViewModel.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation

class HomeViewModel {
    
    private weak var view: HomeView?
    private var router: HomeRouter?
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        
        router.setSourceView(sourceView: view)
    }
    
}

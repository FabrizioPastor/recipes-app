//
//  HomeViewModel.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private weak var view: HomeView?
    private var router: HomeRouter?
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        
        router.setSourceView(sourceView: view)
    }
    
    func getRecipesData() -> Observable<[Recipe]> {
        return ApiManager.shared.getRecipes()
    }
    
    func makeDetailView(recipeId: Int) {
        router?.navegateToDetail(recipeId: recipeId)
    }
    
}

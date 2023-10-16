//
//  DetailViewModel.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation
import RxSwift

class DetailViewModel {
    
    private weak var view: DetailView?
    private var router: DetailRouter?
    
    func bind(view: DetailView, router: DetailRouter) {
        self.view = view
        self.router = router
        
        router.setSourceView(sourceView: view)
    }
    
    func getRecipeData(recipeId: Int) ->  Observable<RecipeDetail> {
        return ApiManager.shared.getDetailRecipes(recipeId: recipeId)
    }
    
    func makeMapView(coordenates: [Double]) {
        router?.navigateToMapView(coordenates: coordenates)
    }
    
}

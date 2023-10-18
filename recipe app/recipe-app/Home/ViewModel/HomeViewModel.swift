//
//  HomeViewModel.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    let title = "Recipes App"
    private let view: HomeView
    var recipes: [Recipe]?
    
    init(view: HomeView) {
        self.view = view
    }
    
    func onViewDidLoad() {
        getRecipesData()
    }
    
    private func getRecipesData() {
        Task {
            guard let recipes = await ApiManager.shared.getRecipes() else {
                self.recipes = []
                return
            }
            self.recipes = recipes
            await view.reloadTableView()
        }
    }
    
    func makeDetailView(recipeId: Int) {
    }
    
}

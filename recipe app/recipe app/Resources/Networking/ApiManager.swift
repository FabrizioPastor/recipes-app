//
//  ApiManager.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import Foundation
import RxSwift

struct ApiManager {
    static func getRecipes() -> Observable<[Recipe]> {
        return Observable.create { observer in
            guard let url = URL(string: Constants.URL.mainUrl + Constants.Endpoints.recipes) else { fatalError("No se pudo crear al URL") }
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let recipes = try JSONDecoder().decode(Recipes.self, from: data)
                    observer.onNext(recipes.recipeList)
                } catch {
                    observer.onError(error)
                    print("getRecipes(): \(error.localizedDescription)")
                }
            }
            
            task.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
    
    static func getDetailRecipes(recipeId: Int) -> Observable<RecipeDetail> {
        return Observable.create { observer in
            guard let url = URL(string: Constants.URL.mainUrl + Constants.Endpoints.recipeDetail) else { fatalError("No se pudo crear al URL") }
            let session = URLSession.shared
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                do {
                    let recipes = try JSONDecoder().decode(RecipesDetail.self, from: data)
                    observer.onNext(recipes.recipeList.filter({ recipeFilter in
                        return recipeFilter.id == recipeId
                    }).first!)
                } catch {
                    observer.onError(error)
                    print("getDetailRecipes(): \(error.localizedDescription)")
                }
            }
            
            task.resume()
            
            return Disposables.create {
                session.finishTasksAndInvalidate()
            }
        }
    }
}

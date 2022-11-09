//
//  HomeRouter.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import Foundation
import UIKit

class HomeRouter {
    
    private var sourceView: HomeView?
    
    var viewController: UIViewController {
        return HomeView()
    }
    
    func setSourceView(sourceView: HomeView?) {
        guard let sourceView = sourceView else {fatalError("HomeView is nil")}
        self.sourceView = sourceView
    }
    
    func navegateToDetail(recipeId: Int) {
        let detailView = DetailRouter().viewController
        detailView.recipeId = recipeId
        sourceView?.navigationController?.pushViewController(detailView, animated: true)
    }
    
}

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
    
    var viewController: UIViewController {
        return DetailView()
    }
    
    func setSourceView(sourceView: DetailView?) {
        guard let sourceView = sourceView else { fatalError("DetailRouter: DetailView is nil") }
        self.sourceView  = sourceView
    }
    
}

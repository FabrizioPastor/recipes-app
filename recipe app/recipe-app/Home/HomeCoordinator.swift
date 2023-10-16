//
//  HomeCoordinator.swift
//  recipe-app
//
//  Created by Fabrizio Pastor on 16/10/23.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = HomeView()
        let viewModel = HomeViewModel(view: viewController)
        viewController.viewModel = viewModel
        navigationController.setViewControllers([viewController], animated: false)
    }
}

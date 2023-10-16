//
//  AppCoordinator.swift
//  recipe-app
//
//  Created by Fabrizio Pastor on 16/10/23.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        let coordinator = HomeCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinators.append(coordinator)
        window.makeKeyAndVisible()
    }
}

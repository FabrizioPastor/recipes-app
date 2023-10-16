//
//  Coordinator.swift
//  recipe-app
//
//  Created by Fabrizio Pastor on 16/10/23.
//

import Foundation

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

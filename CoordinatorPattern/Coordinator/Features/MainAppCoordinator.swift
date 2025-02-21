//
//  MainCoordinator.swift
//  TestsDemo
//
//  Created by Hithakshi on 04/02/25.
//

import UIKit

// MARK: - Main Coordinator
final class MainAppCoordinator: BaseCoordinator {
    private let window: UIWindow
    let navigationController: UINavigationController

    init(window: UIWindow, appDependencies: AppDependencies) {
        self.window = window
        self.navigationController = UINavigationController()
        super.init(navigationController: navigationController, appDependencies: appDependencies)
    }
    
    required init(navigationController: UINavigationController, appDependencies: AppDependencies) {
        fatalError("init(navigationController:appDependencies:) has not been implemented")
    }
    
    override func start() {
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
        startLoginCoordinator()
    }

    func startLoginCoordinator() {
        let loginC = createCoordintor(coordinator: LoginCoordinator.self)
        addChildCoordinator(loginC)
        loginC.delegate = self
        loginC.start()
    }

    func startHomeCoordinator() {
        let homeC = createCoordintor(coordinator: HomeCoordinator.self)
        addChildCoordinator(homeC)
        navigationController.setViewControllers([], animated: false)
        homeC.start()
    }

    func startTabCoordinator() {
        let tabC = createCoordintor(coordinator: TabCoordinator.self)
        addChildCoordinator(tabC)
        navigationController.setViewControllers([], animated: false)
        tabC.start()
    }
}

extension MainAppCoordinator: LoginCoordinatorDelegate {
    func didLogin(from coordinator: LoginCoordinator) {
        startTabCoordinator()
    }
}

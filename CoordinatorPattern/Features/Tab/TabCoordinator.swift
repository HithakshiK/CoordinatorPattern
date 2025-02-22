//
//  MainTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

//
// MARK: - TabCoordinator
final class TabCoordinator: BaseCoordinator {
    private let tabBarController = UITabBarController()

    override func start() {
        // Create child coordinators with their own navigation controllers
        let homeNav = UINavigationController()
        let sellNav = UINavigationController()
        let profileNav = UINavigationController()

        let homeCoordinator = HomeCoordinator(navigationController: homeNav, appDependencies: appDependencies)
        let sellCoordinator = SellCoordinator(navigationController: sellNav, appDependencies: appDependencies)
        let profileCoordinator = ProfileCoordinator(navigationController: profileNav, appDependencies: appDependencies)

        // Configure tab bar items
        homeNav.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )

        sellNav.tabBarItem = UITabBarItem(
            title: "Sell",
            image: UIImage(systemName: "tag"),
            selectedImage: UIImage(systemName: "tag.fill")
        )

        profileNav.tabBarItem = UITabBarItem(
            title: "Me",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )

        // Start each coordinator
        [homeCoordinator, sellCoordinator, profileCoordinator].forEach { coordinator in
            addChildCoordinator(coordinator)
            coordinator.start()
        }

        // Set up tab bar controller
        tabBarController.viewControllers = [homeNav, sellNav, profileNav]
        tabBarController.selectedIndex = 0

        // Configure tab bar appearance
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }

        // Set tab bar controller as the root
        setInitial(viewController: tabBarController, using: .push, animated: false)
    }
}


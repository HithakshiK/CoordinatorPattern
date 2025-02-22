//
//  ProfileCoordinator.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

final class ProfileCoordinator: BaseCoordinator {
    override func start() {
        let viewController = ProfileViewController()
        setInitial(viewController: viewController, using: .push, animated: false)
    }
}

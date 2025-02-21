//
//  SellCoordinator.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

final class SellCoordinator: BaseCoordinator {
    override func start() {
        let viewController = SellViewController()
        setInitial(viewController: viewController, using: .push, animated: false)
    }
}

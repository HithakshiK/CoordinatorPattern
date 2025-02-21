//
//  FeatureCoordinator.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

final class FeatureCoordinator: BaseCoordinator {
    var presentationType: PresentationType = .push

    override func start() {
        setInitial(viewController: FeatureViewController(), using: presentationType)
    }
}

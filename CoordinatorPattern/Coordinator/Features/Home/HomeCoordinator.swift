//
//  HomeCoordinator.swift
//  TestsDemo
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
}

// MARK: - Example Feature Coordinator
final class HomeCoordinator: BaseCoordinator {
    weak var delegate: HomeCoordinatorDelegate?

    override func start() {
        let viewController = HomeViewController()
        viewController.delegate = self
        setInitial(viewController: viewController, using: .push)
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func onPresentAction(from viewController: HomeViewController) {
        let featureCoordinator = createCoordintor(coordinator: FeatureCoordinator.self)
        featureCoordinator.presentationType = .present(modalPresentationStyle: .automatic)
        addChildCoordinator(featureCoordinator)
        featureCoordinator.start()

    }
    
    func onPushAction(from viewController: HomeViewController) {
        let featureCoordinator = createCoordintor(coordinator: FeatureCoordinator.self)
        featureCoordinator.presentationType = .push
        addChildCoordinator(featureCoordinator)
        featureCoordinator.start()
    }
    
    func onEmbedAction(from viewController: HomeViewController, containerView: UIView) {
        let featureCoordinator = createCoordintor(coordinator: FeatureCoordinator.self)
        featureCoordinator.presentationType = .embed(in: viewController, containerView: containerView)
        addChildCoordinator(featureCoordinator)
        featureCoordinator.start()
    }

}


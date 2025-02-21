//
//  BaseCoordinator.swift
//  TestsDemo
//
//  Created by Hithakshi on 04/02/25.
//

import Foundation
import UIKit

// MARK: - Base Coordinator Implementation
class BaseCoordinator: NSObject, Coordinating {
    private let navigationController: UINavigationController
    weak var parentCoordinator: Coordinating?
    var childCoordinators: [Coordinating] = []
    let appDependencies: AppDependencies
    private(set) var initialViewController: UIViewController?

    required init(navigationController: UINavigationController, appDependencies: AppDependencies) {
        self.navigationController = navigationController
        self.appDependencies = appDependencies
        super.init()
        navigationController.delegate = self
    }

    func start() {
        fatalError("Start method must be implemented by derived coordinator")
    }

    func createCoordintor<T: Coordinating>(coordinator: T.Type) -> T {
        T.init(navigationController: navigationController, appDependencies: appDependencies)
    }

    func stop() {
        // Clean up any resources and notify parent
        removeChildren()
        parentCoordinator?.removeChildCoordinator(self)
    }

    private func removeChildren() {
        childCoordinators.forEach { $0.stop() }
        childCoordinators.removeAll()
    }

    func addChildCoordinator(_ coordinator: Coordinating) {
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
    }

    func removeChildCoordinator(_ coordinator: Coordinating) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }

    // MARK: - Navigation Helpers

    func setInitial(viewController: UIViewController, using type: PresentationType, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.initialViewController = viewController
        switch type {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
            if let completion = completion {
                completion()
            }

        case .present(let style):
            viewController.modalPresentationStyle = style
            navigationController.present(viewController, animated: animated, completion: completion)

        case .embed(let parentViewController, let containerView):
            parentViewController.addChild(viewController)
            containerView.addSubview(viewController.view)
            viewController.view.frame = containerView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            viewController.didMove(toParent: parentViewController)
            if let completion = completion {
                completion()
            }
        }
    }

    
}

extension BaseCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Handle back navigation (swipe or button)
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(fromViewController) else {
            return
        }
        if fromViewController == initialViewController {
            stop()
        }
    }

}

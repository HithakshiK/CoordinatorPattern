//
//  BlueCoordinator.swift
//  TestsDemo
//
//  Created by Hithakshi on 13/02/25.
//

import UIKit

protocol LoginCoordinatorDelegate: AnyObject {
    func didLogin(from coordinator: LoginCoordinator)
}

// MARK: - Example Feature Coordinator
final class LoginCoordinator: BaseCoordinator {
    weak var delegate: LoginCoordinatorDelegate?

    override func start() {
        let viewController = LoginViewController()
        viewController.delegate = self
        setInitial(viewController: viewController, using: .push)
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    func onLoginAction(from viewController: LoginViewController) {
        delegate?.didLogin(from: self)
        stop()
    }
}

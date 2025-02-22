//
//  BlueViewController.swift
//  TestsDemo
//
//  Created by Hithakshi on 13/02/25.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func onLoginAction(from viewController: LoginViewController)
}

final class LoginViewController: UIViewController {
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        return button
    }()

    weak var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(loginButton)
        loginButton.autoCenterInSuperview()
        loginButton.addTarget(self, action: #selector(onLoginAction), for: .touchUpInside)
    }

    @objc
    private func onLoginAction() {
        delegate?.onLoginAction(from: self)
    }

}

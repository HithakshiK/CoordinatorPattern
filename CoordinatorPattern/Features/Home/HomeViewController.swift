//
//  HomeViewController.swift
//  TestsDemo
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func onPresentAction(from viewController: HomeViewController)
    func onPushAction(from viewController: HomeViewController)
    func onEmbedAction(from viewController: HomeViewController, containerView: UIView)
}

final class HomeViewController: UIViewController {
    private let presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present", for: .normal)
        return button
    }()

    private let pushButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        return button
    }()

    private let embedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Embed", for: .normal)
        return button
    }()

    private let containerView = UIView()

    weak var delegate: HomeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let hStack = UIStackView(arrangedSubviews: [presentButton, pushButton, embedButton])
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually

        view.addSubview(hStack)
        view.addSubview(containerView)

        containerView.backgroundColor = .white
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 2
        hStack.autoPinEdgesToSuperviewSafeArea(excludingEdge: .bottom)
        containerView.autoPinEdgesToSuperviewSafeArea(with: .init(top: 8, left: 8, bottom: 8, right: 8), excludingEdge: .top)
        hStack.autoPinEdge(.bottom, to: .top, of: containerView)

        presentButton.addTarget(self, action: #selector(onPresentAction), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(onPushAction), for: .touchUpInside)
        embedButton.addTarget(self, action: #selector(onEmbedAction), for: .touchUpInside)
    }

    @objc
    private func onPresentAction() {
        delegate?.onPresentAction(from: self)
    }

    @objc
    private func onPushAction() {
        delegate?.onPushAction(from: self)
    }

    @objc
    private func onEmbedAction() {
        delegate?.onEmbedAction(from: self, containerView: containerView)
    }

}

//
//  ProfileViewController.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

final class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Profile"

        let label = UILabel()
        label.text = "Profile Tab Content"
        view.addSubview(label)
        label.autoCenterInSuperview()
    }

}

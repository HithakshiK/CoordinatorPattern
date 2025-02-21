//
//  SellViewController.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

final class SellViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Sell"

        let label = UILabel()
        label.text = "Sell Tab Content"
        view.addSubview(label)
        label.autoCenterInSuperview()
    }
}


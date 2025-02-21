//
//  FeatureViewController.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

final class FeatureViewController: UIViewController {

    init(title: String = "Feature") {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        // Add some sample content
        let label = UILabel()
        label.text = "Feature Content"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

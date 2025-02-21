//
//  PresentationType.swift
//  TestsDemo
//
//  Created by Hithakshi on 04/02/25.
//

import UIKit

// MARK: - Presentation Types
enum PresentationType {
    case push
    case present(modalPresentationStyle: UIModalPresentationStyle = .fullScreen)
    case embed(in: UIViewController, containerView: UIView)
}

//
//  CoordinatorManaged.swift
//  TestsDemo
//
//  Created by Hithakshi on 04/02/25.
//

import Foundation

// MARK: - View Controller Protocol
protocol CoordinatorManaged: AnyObject {
    var owningCoordinator: Coordinating? { get set }
}

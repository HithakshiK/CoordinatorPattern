//
//  Coordinator.swift
//  TestsDemo
//
//  Created by Hithakshi on 21/01/25.
//

import UIKit

// MARK: - Base Protocols

protocol Coordinating: AnyObject {
    typealias CleanUpOperation = (Coordinating) -> Void

    // should always have navigation controller
    // either you provide exising or create new and give it coordinator.
    // Challenges - present in half screen, some navigation should be within coordinator and some may require to navigate to outside of current coordinator scope.
    // For example, start coordinator with new navigation controller, push few screens , let's say one profile says go to profile, in this case, we may need to visit profile page in full screen mode.
    // 2 options, change presentation style on push and exit
    // or ask parent coordintor to handle this or ask delegate to handle this 
    var parentCoordinator: Coordinating? { get set }
    var childCoordinators: [Coordinating] { get set }
    var appDependencies: AppDependencies { get }
    var cleanUp: CleanUpOperation? { get set }

    init(navigationController: UINavigationController, appDependencies: AppDependencies)

    func start()
    func stop()
    func addChildCoordinator(_ coordinator: Coordinating)
    func removeChildCoordinator(_ coordinator: Coordinating)
}

extension Coordinating {
    /// Just builder function for regular Coordinator `start()`
    /// - Returns: itself
    func starts() -> Self {
        start()
        return self
    }

    /// Assign `cleanUp` with the given closure
    /// This is created with intention to allow creating Coordinator by using builder pattern
    /// ```swift
    /// // Example of starting and assign cleanUp while creating the Coordinator
    ///
    /// MyCoordinator()
    ///     .starts()
    ///     .whenStopped { coordinator in
    ///          doRemove(coordinator)
    ///     }
    /// ```
    /// - Parameter cleanUp: Void closure that accept the caller
    /// - Returns: itself
    func whenStopped(do cleanUp: @escaping (Coordinating) -> Void) -> Self {
        self.cleanUp = cleanUp
        return self
    }
}

//
//  AppDelegate.swift
//  CoordinatorPattern
//
//  Created by Hithakshi on 21/02/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    private var coordinator: MainAppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        startMainAppCoordinator()
        return true
    }

    private func startMainAppCoordinator() {
        guard let window else { return }
        let coordinator = MainAppCoordinator(window: window, appDependencies: AppDependencies(networkService: NetworkService(), tracker: EventTracker()))
        self.coordinator = coordinator
        coordinator.start()
    }
}


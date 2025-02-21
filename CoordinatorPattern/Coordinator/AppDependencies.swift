//
//  AppDependencies.swift
//  TestsDemo
//
//  Created by Hithakshi on 04/02/25.
//


protocol InternalTrackingEventTracker {}

protocol NetworkServicing {}

protocol HasTrackingProvider {
    var tracker: InternalTrackingEventTracker { get }
}

struct NetworkService: NetworkServicing {}

struct EventTracker: InternalTrackingEventTracker {}

// MARK: - appDependencies Protocol
struct AppDependencies: HasTrackingProvider, NetworkServicing {
    var networkService: NetworkServicing
    var tracker: InternalTrackingEventTracker
}

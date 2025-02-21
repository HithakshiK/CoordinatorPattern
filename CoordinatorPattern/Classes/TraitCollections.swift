//
//  TraitCollections.swift
//  Caramell-iOS
//
//  Created by Jay on 21/6/21.
//

import UIKit

@available(iOS 13, *)
public struct TraitCollections {

    static let styles = [
        UITraitCollection(userInterfaceStyle: .light),
        UITraitCollection(userInterfaceStyle: .dark)
    ]
}

public protocol URLThemeSwitchable {
    var darkAssetURL: URL? { get }
    var lightAssetURL: URL? { get }
    var darkAsset3xURL: URL? { get }
    var lightAsset3xURL: URL? { get }
    var themeURL: URL? { get }
}

public extension URLThemeSwitchable {

    var themeURL: URL? {
        guard #available(iOS 13, *), let darkAssetURL else {
            return UIScreen.main.scale == 2 ? lightAssetURL : lightAsset3xURL
        }
        switch UIApplication.shared.keyWindow?.traitCollection.userInterfaceStyle {
        case .dark:
            return UIScreen.main.scale == 2 ? darkAssetURL : darkAsset3xURL
        default:
            return UIScreen.main.scale == 2 ? lightAssetURL : lightAsset3xURL
        }
    }

    /**
        If no 3x asset URL is provided, use default 2x
     */
    var darkAsset3xURL: URL? {
        return darkAssetURL
    }

    var lightAsset3xURL: URL? {
        return lightAssetURL
    }
}

//
//  UIApplication + Extensions.swift
//  DrinKitPreparing
//
//  Created by user on 06.10.2024.
//

import UIKit

extension UIApplication {
    static var firstKeyWindowForConnectedScenes: UIWindow? {
        UIApplication.shared
            .connectedScenes.lazy
            .compactMap { $0.activationState == .foregroundActive ? ($0 as? UIWindowScene) : nil }
            .first(where: { $0.keyWindow != nil })?
            .keyWindow
    }
}

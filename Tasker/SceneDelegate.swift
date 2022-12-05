//
//  SceneDelegate.swift
//  Tasker
//
//  Created by Aurocheg on 5.11.22.
//

import UIKit

let themeWindow = ThemeWindow()

final class ThemeWindow: UIWindow {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if Theme.current == .system {
            DispatchQueue.main.async {
                Theme.system.setActive()
            }
        }
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let rootVC = SignInViewController()
        let navigationController = UINavigationController(rootViewController: rootVC)
        
        let darkColor = UIColor(red: 0.11, green: 0.071, blue: 0.263, alpha: 1)
        navigationController.navigationBar.tintColor = UIColor.color(light: darkColor, dark: .white)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        themeWindow.makeKey()
    }
}

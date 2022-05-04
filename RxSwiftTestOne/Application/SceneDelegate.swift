//
//  SceneDelegate.swift
//  RxSwiftTestOne
//
//  Created by Ming on 2022/04/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        
        self.appCoordinator = AppCoordinator(window: self.window!)
        appCoordinator.start()
    }
}

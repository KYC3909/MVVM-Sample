//
//  SceneDelegate.swift
//  MVVM Sample
//
//  Created by Krunal on 11/03/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        self.appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }

}


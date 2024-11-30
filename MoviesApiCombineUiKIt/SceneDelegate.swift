//
//  SceneDelegate.swift
//  MoviesApiCombineUiKIt
//
//  Created by Brian Surface on 11/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate{
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = MoviesViewController(viewModel: MovieListViewModel(httpClient: HttpClient()))
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    
    }
}

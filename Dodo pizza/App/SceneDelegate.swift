//
//  SceneDelegate.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 04.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        
        let menuScreenVC = MenuScreenVC()
        let menuScreenNavVC = UINavigationController(rootViewController: menuScreenVC)
        menuScreenNavVC.tabBarItem = .init(
            title: "Меню",
            image: UIImage(named: "tabbarMenuGrey"),
            selectedImage: UIImage(named: "tabbarMenuOrange")
        )
        
        let profileVC = ProfileViewController()
        let profileNavVC = UINavigationController(rootViewController: profileVC)
        profileNavVC.tabBarItem = .init(
            title: "Профиль",
            image: UIImage(named: "tabbarProfileGrey"),
            selectedImage: UIImage(named: "tabbarProfileOrange")
        )
        
        let contactsVC = ContactsViewController()
        let contactsNavVC = UINavigationController(rootViewController: contactsVC)
        contactsNavVC.tabBarItem = .init(
            title: "Контакты",
            image: UIImage(named: "tabbarContactsGrey"),
            selectedImage: UIImage(named: "tabbarContactsOrange")
        )
        
        let basketVC = BasketViewController()
        let basketNavVC = UINavigationController(rootViewController: basketVC)
        basketNavVC.tabBarItem = .init(
            title: "Корзина",
            image: UIImage(named: "tabbarBasketGrey"),
            selectedImage: UIImage(named: "tabbarBasketOrange")
        )
        
        
        let tabbar = UITabBarController()
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 12)
        ]
        appearance.backgroundColor = UIColor(
            red: 228/255,
            green: 226/255,
            blue: 226/255,
            alpha: 1
        )
        
        tabbar.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabbar.tabBar.scrollEdgeAppearance = appearance
        } else {
            tabbar.tabBar.isTranslucent = true
        }
        tabbar.tabBar.tintColor = .red
        tabbar.modalPresentationStyle = .fullScreen
        tabbar.viewControllers = [menuScreenNavVC, profileNavVC, contactsNavVC, basketNavVC]
        
        window?.rootViewController = tabbar
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}


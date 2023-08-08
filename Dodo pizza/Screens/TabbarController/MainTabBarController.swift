//
//  MainTabBarController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 08.08.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    func setupTabbar() {
        
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
        
        tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = appearance
        } else {
            tabBar.isTranslucent = true
        }
        tabBar.tintColor = .red
        viewControllers = [menuScreenNavVC, profileNavVC, contactsNavVC, basketNavVC]
    }
}

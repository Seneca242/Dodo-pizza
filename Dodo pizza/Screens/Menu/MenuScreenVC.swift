//
//  ViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 04.07.2023.
//

import UIKit
import SnapKit

final class MenuScreenVC: UIViewController {
    
    let productService = ProductService()
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        fetchProducts()
    }
    
    private func fetchProducts() {
        products = productService.fetchProducts()
    }
    
//    private func createTabbar() {
//        let menuScreenVC = MenuScreenVC()
//        let menuScreenNavVC = UINavigationController(rootViewController: menuScreenVC)
//        
//        let profileVC = ProfileViewController()
//        let profileNavVC = UINavigationController(rootViewController: profileVC)
//        
//        let contactsVC = ContactsViewController()
//        let contactsNavVC = UINavigationController(rootViewController: contactsVC)
//        
//        let basketVC = BasketViewController()
//        let basketNavVC = UINavigationController(rootViewController: basketVC)
//        
//        
//        let tabbar = UITabBarController()
//        let appearance = UITabBarAppearance()
//        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
//        appearance.backgroundColor = UIColor(
//            red: 228/255,
//            green: 226/255,
//            blue: 226/255,
//            alpha: 1
//        )
//        
//        tabbar.tabBar.standardAppearance = appearance
//        if #available(iOS 15.0, *) {
//            tabbar.tabBar.scrollEdgeAppearance = appearance
//        } else {
//            tabbar.tabBar.isTranslucent = true
//        }
//        tabbar.tabBar.tintColor = .red
////        tabbar.tabBar.unselectedItemTintColor = UIColor.black
//        
//        menuScreenVC.tabBarItem.title = "Меню"
//        profileVC.tabBarItem.title = "Профиль"
//        contactsVC.tabBarItem.title = "Контакты"
//        basketVC.tabBarItem.title = "Корзина"
//        
////        menuScreenVC.tabBarItem = .init(
////            title: "Меню",
////            image: UIImage(named: "tabbarMenuGrey")?.withTintColor(.black) .withRenderingMode(.alwaysOriginal),
////            selectedImage: UIImage(named: "tabbarMenuOrange")
////        )
////        
//////        philosophersNavigationVC.tabBarItem.badgeColor = .white
////        
////        profileVC.tabBarItem = .init(
////            title: "Профиль",
////            image: UIImage(named: "tabbarProfileGrey")?.withTintColor(.black) .withRenderingMode(.alwaysOriginal),
////            selectedImage: UIImage(named: "tabbarProfileOrange")
////        )
////        
////        contactsVC.tabBarItem = .init(
////            title: "Контакты",
////            image: UIImage(named: "tabbarContactsGrey")?.withTintColor(.black) .withRenderingMode(.alwaysOriginal),
////            selectedImage: UIImage(named: "tabbarContactsOrange")
////        )
////        
////        basketVC.tabBarItem = .init(
////            title: "Корзина",
////            image: UIImage(named: "tabbarBasketGrey")?.withTintColor(.black) .withRenderingMode(.alwaysOriginal),
////            selectedImage: UIImage(named: "tabbarBasketOrange")
////        )
////        
//////        basketVC.tabBarItem.badgeColor = .white
//        
//        tabbar.modalPresentationStyle = .fullScreen
//        tabbar.viewControllers = [menuScreenNavVC, profileNavVC, contactsNavVC, basketNavVC]
//        present(tabbar, animated: true)
//    }

}

extension MenuScreenVC {
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MenuScreenVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else {return UITableViewCell()}
        let product = products[indexPath.row]
        cell.update(product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let pizzaDescriptionVC = PizzaDescriptionVC()
        let pizza = products[indexPath.row]
        pizzaDescriptionVC.pizza = pizza
        present(pizzaDescriptionVC, animated: true)
    }
}


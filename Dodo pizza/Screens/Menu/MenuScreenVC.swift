//
//  ViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 04.07.2023.


import UIKit
import SnapKit

enum MenuSection: Int, CaseIterable {
    case bigBanners = 0
    case banners = 1
    case categories = 2
    case products = 3
    
}

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
        tableView.register(BannerTableCell.self, forCellReuseIdentifier: BannerTableCell.reuseID)
        tableView.register(BigBannerTableCell.self, forCellReuseIdentifier: BigBannerTableCell.reuseID)
        tableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.reuseID)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        fetchProducts()
        setupNavigationBar()
        setupSearchButton()
        setupCityButton()
        
    }
    
    private func setupSearchButton() {
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped)
        )
        navigationItem.rightBarButtonItem = searchButton
    }
    
    private func setupCityButton() {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Москва"
        
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 10, weight: .bold)
        let dropdownImage = UIImage(
            systemName: "chevron.down")?
            .withConfiguration(imageConfig
            )
        
        configuration.image = dropdownImage
        configuration.imagePadding = 5
        configuration.imagePlacement = .trailing
        
        let cityButton = UIButton(configuration: configuration)
        cityButton.addTarget(
            self,
            action: #selector(cityButtonTapped),
            for: .touchUpInside
        )
        
        let barButtonItem = UIBarButtonItem(customView: cityButton)
        navigationItem.leftBarButtonItem = barButtonItem
    }
    
    @objc private func searchButtonTapped() {
        let searchVC = SearchViewController()
        searchVC.products = products
        present(searchVC, animated: true)
    }
    
    @objc private func cityButtonTapped() {
        let cityVC = CityViewController()
        let navigationController = UINavigationController(rootViewController: cityVC)
        present(navigationController, animated: true)
    }
    
    private func fetchProducts() {
        products = productService.fetchProducts()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .black
    }
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
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section ==  0 {
            return 150
        }
        if  indexPath.section == 1  {
            return 80
        }
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let section = MenuSection(rawValue: section) {
            switch section {
            case .bigBanners:
                return 1
            case .banners:
                return 1
            case .categories:
                return 1
            case .products:
                return products.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let section = MenuSection(rawValue: indexPath.section) {
            switch section {
            case .bigBanners:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigBannerCell", for: indexPath) as? BigBannerTableCell else { return UITableViewCell() }
                return cell
            case .banners:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerTableCell else { return UITableViewCell() }
                return cell
            case .categories:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
                return cell
            case .products:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.reuseID, for: indexPath) as? ProductCell else { return UITableViewCell() }
                let product = products[indexPath.row]
                cell.update(product)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let section = MenuSection(rawValue: indexPath.section) {
            switch section {
            case .bigBanners:
                break
            case .banners:
                break
            case .categories:
                break
            case .products:
                let pizzaDescriptionVC = PizzaDescriptionVC()
                let pizza = products[indexPath.row]
                pizzaDescriptionVC.pizza = pizza
                present(pizzaDescriptionVC, animated: true)
            }
        }
    }
}


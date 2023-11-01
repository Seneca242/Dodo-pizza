//
//  ViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 04.07.2023.

import UIKit
import SnapKit

enum MenuSection: Int, CaseIterable {
    case deliveryOrNot = 0
    case bigBanners = 1
    case banners = 2
    case categories = 3
    case bigPizzaProduct = 4
    case products = 5
    
}

final class MenuScreenVC: UIViewController {
    
    //MARK: Services
    let productService = ProductService()
    let bigPizzaService = BigPizzaService()
    let productMockDataAPI = ProductsMockData()
    let networkManager = NetworkManager()
    
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var bigPizzaProduct: Product? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var bigBanners: [Banner] = []
    var currentBigBannerIndex: Int = 0
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductTableCell.self, forCellReuseIdentifier: ProductTableCell.reuseID)
        tableView.register(BigPizzaTableCell.self, forCellReuseIdentifier: BigPizzaTableCell.reuseID)
        tableView.register(DeliveryOrNotTableCell.self, forCellReuseIdentifier: DeliveryOrNotTableCell.reuseID)
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
        setupNavigationBar()
        setupSearchButton()
        setupCityButton()
        
//        fetchProducts()
        fetchData(from: productMockDataAPI.productMockDataAPI)
        fetchBigPizzaProduct()
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

//MARK: - NavigationBar
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

//MARK: - BannerCellDelegate
extension MenuScreenVC: BannerCellDelegate {
    func didBannerCellTap(_ banner: Banner) {
        showBannerDetailScreen(banner)
    }
}

//MARK: - Navigation
extension MenuScreenVC {
    
    func showBannerDetailScreen(_ banner: Banner) {
        let bannerDetailVC = BannerDetailViewController()
        bannerDetailVC.bannerProduct = banner
        present(bannerDetailVC, animated: true)
    }
    
    func showStoriesScreen(_ bigBanner: Banner) {
        //        let storiesScreen = StoriesViewController()
        //        present(storiesScreen, animated: true)
        guard let stories = bigBanner.stories else { return }
        let storiesScreen = StoriesViewController(stories: stories)
        storiesScreen.didFinishLastStory = { [weak self] in
            guard let self = self else { return }
            self.currentBigBannerIndex += 1
            if self.currentBigBannerIndex < self.bigBanners.count {
                self.showStoriesScreen(self.bigBanners[self.currentBigBannerIndex])
            } else {
                self.currentBigBannerIndex = 0
            }
        }
        present(storiesScreen, animated: true)
    }
    
    func showEnterPhoneNumberScreen() {
        let enterPhoneNumberVC = EnterPhoneNumberVC()
        enterPhoneNumberVC.delegate = self
        let navigationController = UINavigationController(rootViewController: enterPhoneNumberVC)
        present(navigationController, animated: true)
        navigationController.presentationController?.delegate = self
    }
    
    func showSearchScreen() {
        let searchVC = SearchViewController()
        searchVC.products = products
        present(searchVC, animated: true)
    }
    
    func showCityScreen() {
        let cityVC = CityViewController()
        let navigationController = UINavigationController(rootViewController: cityVC)
        present(navigationController, animated: true)
    }
    
    func showProductDescriptionScreen(_ pizza: Product) {
        let productDescriptionVC = ProductDescriptionVC()
        productDescriptionVC.product = pizza
        present(productDescriptionVC, animated: true)
    }
}

//MARK: - Business logic
extension MenuScreenVC {
    
    private func fetchData(from url: String?) {
        networkManager.fetchData(from: url ?? "") { [weak self] result in
            switch result {
            case .success(let products):
                self?.products = products
                self?.tableView.reloadData()
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
                
            }
        }
    }
    
//    private func fetchProducts() {
//        products = productService.fetchProducts()
//    }
    
    private func fetchBigPizzaProduct() {
        bigPizzaProduct = bigPizzaService.fetchBigPizzaProduct()
    }
    
    private func fetchBigBanners() {
        let bigBannerService = BigBannerService()
        bigBanners = bigBannerService.fetchBigBanners()
    }
}

//MARK: - Event Handler (Actions)
extension MenuScreenVC {
    
    func categoryCellTapped(_ category: Category) {
        print(#line, category)
    }
    
    @objc private func searchButtonTapped() {
        showSearchScreen()
    }
    
    @objc private func cityButtonTapped() {
        showCityScreen()
    }
    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            showEnterPhoneNumberScreen()
        }
    }

    @objc func deliveryAddressButtonTapped() {
        showEnterPhoneNumberScreen()
    }
}

//MARK: - UITableViewDataSource
extension MenuScreenVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch MenuSection(rawValue: indexPath.section) {
        case .bigBanners:
            return 150
        case .banners:
            return 200
        case .bigPizzaProduct:
            return 400
        case .categories:
            return 60
        default:
            return UITableView.automaticDimension
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MenuSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let section = MenuSection(rawValue: section) {
            switch section {
            case .deliveryOrNot:
                return 1
            case .bigBanners:
                return 1
            case .banners:
                return 1
            case .categories:
                return 1
            case .bigPizzaProduct:
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
                
            case .deliveryOrNot:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryOrNotTableCell", for: indexPath) as? DeliveryOrNotTableCell else { return UITableViewCell() }
                cell.segmentedControl.addTarget(
                    self,
                    action: #selector(segmentedControlChanged(_:)),
                    for: .valueChanged
                )
                cell.deliveryAddressButton.addTarget(
                    self,
                    action: #selector(deliveryAddressButtonTapped),
                    for: .touchUpInside
                )
                return cell
                
            case .bigBanners:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BigBannerTableCell", for: indexPath) as? BigBannerTableCell else { return UITableViewCell() }
                cell.onBigBannerCellTapped = { bigBanner in
                    self.showStoriesScreen(bigBanner)
                }
            
                return cell
                
            case .banners:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableCell", for: indexPath) as? BannerTableCell else { return UITableViewCell() }
                cell.delegate = self
                return cell
                
            case .categories:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell else { return UITableViewCell() }
                
                cell.onCategoryCellTapped = { category in
                    self.categoryCellTapped(category)
                }
                return cell
            case .bigPizzaProduct:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: BigPizzaTableCell.reuseID, for: indexPath) as? BigPizzaTableCell else { return UITableViewCell() }
                if let bigPizzaProduct = bigPizzaProduct {
                    cell.update(bigPizzaProduct)
                }
                return cell
            case .products:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableCell.reuseID, for: indexPath) as? ProductTableCell else { return UITableViewCell() }
                let product = products[indexPath.row]
                cell.update(product)
                return cell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension MenuScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let section = MenuSection(rawValue: indexPath.section) {
            switch section {
            case .deliveryOrNot:
                break
            case .bigBanners:
                break
            case .banners:
                break
            case .categories:
                break
            case .bigPizzaProduct:
                guard let bigPizzaProduct = bigPizzaProduct else { return }
                showProductDescriptionScreen(bigPizzaProduct)
            case .products:
                let product = products[indexPath.row]
                showProductDescriptionScreen(product)
            }
        }
    }
}

extension MenuScreenVC: EnterPhoneNumberVCDelegate {
    func enterPhoneNumberVCDidClose() {
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: MenuSection.deliveryOrNot.rawValue)) as? DeliveryOrNotTableCell {
            cell.segmentedControl.selectedSegmentIndex = 0
        }
    }
}

extension MenuScreenVC: UIAdaptivePresentationControllerDelegate {
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: MenuSection.deliveryOrNot.rawValue)) as? DeliveryOrNotTableCell {
                cell.segmentedControl.selectedSegmentIndex = 0
            }
        }
    }
}

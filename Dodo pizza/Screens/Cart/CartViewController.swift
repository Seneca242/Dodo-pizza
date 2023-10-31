//
//  BasketViewController.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 03.08.2023.
//

import UIKit
import SnapKit

enum BasketSection: Int, CaseIterable {
    case basketResultLabel = 0
    case orderDetail = 1
    case orderSupplement = 2
    case dealСode = 3
    case otherOrderDetail = 4
    case orderButton = 5
}

final class CartViewController: UIViewController {
    
    //MARK: - Services
    private let cartStorage = StorageManager()
    
    //MARK: - Models
    var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    //MARK: - UI Elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
//        tableView.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductTableCell.self, forCellReuseIdentifier: ProductTableCell.reuseID)
        return tableView
    }()
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowColor = nil
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .black
        title = "Корзина"
    }

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        setupViews()
        setupConstraints()
        getProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getProducts()
        tableView.reloadData()
    }
}

//MARK: - Layout
extension CartViewController {
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - Business Logic
extension CartViewController {
    func getProducts() {
        products = cartStorage.fetchProducts()
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource
extension CartViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        BasketSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(products.count)
        
        if let section = BasketSection(rawValue: section) {
            switch section {
                
            case .basketResultLabel:
                return 1
            case .orderDetail:
                return products.count
            case .orderSupplement:
                return 1
            case .dealСode:
                return 1
            case .otherOrderDetail:
                return 1
            case .orderButton:
                return 1
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let section = BasketSection(rawValue: indexPath.section) {
            switch section {
                
            case .basketResultLabel:
                break
            case .orderDetail:
                
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableCell.reuseID, for: indexPath) as? ProductTableCell else { return UITableViewCell() }
                let product = products[indexPath.row]
                cell.quantityLabel.text = "\(product.quantity)"
                cell.update(product)
                return cell
                
            case .orderSupplement:
                break
            case .dealСode:
                break
            case .otherOrderDetail:
                break
            case .orderButton:
                break
            }
        }
        return UITableViewCell()
    }
    
    func updateProductInCart(product: Product, newQuantity: Int) {
        if let index = products.firstIndex(where: { $0.name == product.name }) {
            products[index].quantity = newQuantity
            cartStorage.updateProductQuantity(product: product, newQuantity: newQuantity)
            tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDelegate
extension CartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


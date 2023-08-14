//
//  BannerCollectionViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 09.08.2023.
//

import UIKit
import SnapKit

class BannerCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let reuseID = "BannerCell"
    
    let bannerService = BannerService()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var banners: [Banner] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: BannerCollectionViewCell.reuseID)
        fetchBanner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
//        contentView.addSubview(collectionView)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
//            make.edges.equalTo(contentView.safeAreaLayoutGuide)
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseID, for: indexPath) as? BannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        let banner = banners[indexPath.row]
        cell.update(banner)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    private func fetchBanner() {
        banners = bannerService.fetchBanners()
    }
}

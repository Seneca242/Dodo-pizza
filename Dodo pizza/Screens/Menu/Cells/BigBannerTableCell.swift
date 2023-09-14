//
//  BigBannerTableCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 14.09.2023.
//

import UIKit

import SnapKit

class BigBannerTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let reuseID = "BigBannerCell"
    
    let bigBannerService = BigBannerService()
    private let sectionInserts = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceHorizontal = true
        return collectionView
    }()
    
    var bigBanners: [Banner] = [] {
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
        collectionView.register(BigBannerCollectionViewCell.self, forCellWithReuseIdentifier: BigBannerCollectionViewCell.reuseID)
        fetchBanner()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(collectionView)
        //        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.left.right.equalTo(contentView).inset(4)
            make.height.equalTo(100)
            make.width.greaterThanOrEqualTo(100)
//            make.height.equalTo(150)
        }
        //        collectionView.snp.makeConstraints { make in
        ////            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        //            make.edges.equalToSuperview()
        //        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bigBanners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigBannerCollectionViewCell.reuseID, for: indexPath) as? BigBannerCollectionViewCell else {
            return UICollectionViewCell()
        }
        let bigBanner = bigBanners[indexPath.row]
        cell.update(bigBanner)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height * 1.9, height: collectionView.bounds.height * 1.2)
//        return CGSize(width: 150 * 1.6, height: 150 * 0.8)
        //        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    private func fetchBanner() {
        bigBanners = bigBannerService.fetchBanners()
    }
}
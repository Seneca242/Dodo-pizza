//
//  BigBannerTableCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 14.09.2023.
//

import UIKit
import SnapKit

class BigBannerTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let reuseID = "BigBannerTableCell"
    
    var onBigBannerCellTapped: ((BigBanner) -> ())?

    let bigBannerService = BigBannerService()
    
    private let sectionInserts = UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0)

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceHorizontal = true
        return collectionView
    }()

    var bigBanners: [BigBanner] = [] {
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
        fetchBigBanner()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        contentView.addSubview(collectionView)
    }

    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.left.right.equalTo(contentView).inset(4)
            make.height.equalTo(100)
            make.width.greaterThanOrEqualTo(100)
        }
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
        return CGSize(width: collectionView.bounds.height * 1.0, height: collectionView.bounds.height * 1.0)
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

    private func fetchBigBanner() {
        bigBanners = bigBannerService.fetchBigBanners()
    }
}

extension BigBannerTableCell {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let bigBanners = bigBanners[indexPath.item]
        onBigBannerCellTapped?(bigBanners)
    }
}

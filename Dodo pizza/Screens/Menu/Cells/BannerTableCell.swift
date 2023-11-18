//
//  BannerCollectionViewCell.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 09.08.2023.
//

import UIKit
import SnapKit

protocol BannerCellDelegate: AnyObject {
    func didBannerCellTap(_ banner: Banner)
}

class BannerTableCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: BannerCellDelegate?
    static let reuseID = "BannerTableCell"
    private let networkManager = NetworkManager()
    
    let bannerService = BannerService()
    private let sectionInserts = UIEdgeInsets(
        top: 0,
        left: 0,
        bottom: 0,
        right: 0
    )
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Выгодно и вкусно"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.alwaysBounceHorizontal = true
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
        fetchBannerData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(headerView)
        headerView.addSubview(headerLabel)
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.leading.equalTo(headerView).offset(16)
            make.trailing.equalTo(headerView).offset(-16)
            make.top.bottom.equalTo(headerView)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
//            make.height.equalTo(80)
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
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.height * 1.9, height: collectionView.bounds.height * 1.2)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
//    private func fetchBanner() {
//        banners = bannerService.fetchBanners()
//    }
    
    private func fetchBannerData() {
        
        guard let url = bannerService.getURL() else { return }
        
        networkManager.fetchBannerData(from: url) { [weak self] result in
            switch result {
            case .success(let banners):
                self?.banners = banners
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
                
            }
        }
    }
}

extension BannerTableCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        if offsetX < 0 {
            headerLabel.transform = CGAffineTransform(translationX: -offsetX, y: 0)
        } else {
            headerLabel.transform = .identity
        }
    }
}

//MARK: - UITableViewDelegate
extension BannerTableCell: UITableViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let banner = banners[indexPath.row]
        delegate?.didBannerCellTap(banner)
    }
}

//
//  CategoryTVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CategoryTVC: UITableViewCell, ReusableView {
    
    private lazy var items: Array<CategoryItems> = {
        return Array<CategoryItems>()
    }()

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionViewSetup()
        }
    }
}

// MARK: - Methods

extension CategoryTVC {
    fileprivate func collectionViewSetup() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.categoryViewLayout()
        collectionView.register(CategoryCVC.self)
    }
    
    internal func fill(cell by: Array<CategoryItems>) {
        self.items = by
        collectionView.asyncReload()
    }
}

// MARK: - CollectionView Implementation

extension CategoryTVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: CategoryCVC.reuseIdentifier,
                                 for: indexPath) as? CategoryCVC else {
                                    return UICollectionViewCell()
        }
        cell.fill(cell: items[indexPath.row])
        return cell
    }
}

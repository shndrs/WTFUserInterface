//
//  MenuTVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class MenuTVC: UITableViewCell {
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    internal func fill(cell by: String) {
        
    }
}

extension MenuTVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

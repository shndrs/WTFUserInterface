//
//  UICollectionView.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func asyncReload() {
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.reloadData()
        }
    }
    
    func register(with id: String) {
        
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: id)
    }
    
    func register<T: UICollectionViewCell>(_ type: T.Type) where T: NibLoadable, T: ReusableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)

        self.register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}

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
            
            guard self != nil else { return }
            
            self?.reloadData()
        }
    }
    
    func register(with id: String) {
        
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: id)
    }
    
    func categoryViewLayout() {
        
        DispatchQueue.main.async { [weak self] in
            
            guard self != nil else { return }
            
            let cellSize = CGSize(width:128, height:160)
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = cellSize
            layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
            layout.minimumLineSpacing = 1.0
            layout.minimumInteritemSpacing = 1.0
            self?.setCollectionViewLayout(layout, animated: false)
        }
    }
}

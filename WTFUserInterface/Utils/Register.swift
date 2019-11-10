//
//  Register.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/10/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class Register: NSObject {
    
    static func with<T>(cell: T, reuseIdentifier: String) {
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        
        switch cell {
            
            case is UITableView:
                
                guard let cell = cell as? UITableView else { return }
                cell.register(nib, forCellReuseIdentifier: reuseIdentifier)
            
            case is UICollectionView:
                
                guard let cell = cell as? UICollectionView else { return }
                cell.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
            
            default:
                break;
        }
    }
}

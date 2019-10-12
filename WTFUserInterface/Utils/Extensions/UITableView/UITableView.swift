//
//  UITableView.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

extension UITableView {
    
    func asyncReload() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}

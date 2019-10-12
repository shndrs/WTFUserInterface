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
    
    func cleanFooterView() {
        DispatchQueue.main.async {
            self.tableFooterView?.backgroundColor = .clear
            self.tableFooterView = UIView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: self.frame.size.width,
                                                        height: 1))
        }
    }
    
    func asyncReload(in section: Int, rowAnimation:UITableView.RowAnimation = .fade) {
        DispatchQueue.main.async {
            self.beginUpdates()
            self.reloadSections(IndexSet(integer: section), with: rowAnimation)
            self.endUpdates()
        }
    }
    
    func registerCell(with id: String) {
        
        let nib = UINib(nibName: id, bundle: nil)
        self.register(nib, forCellReuseIdentifier: id)
    }
}

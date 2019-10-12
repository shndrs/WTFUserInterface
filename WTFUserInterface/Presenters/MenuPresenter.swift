//
//  MenuPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol MenuView: AnyObject {
    func setTableView(with array: Array<MenuModel>) -> Void
}

final class MenuPresenter: NSObject {
    
    private weak var view: MenuView?
    
    internal init(view: MenuView) {
        self.view = view
    }
    
    
    internal func getData() {
        
        let dwi = DispatchWorkItem {
            for i in 1...5 {
                print("DispatchWorkItem \(i)")
            }
        }
//
//        dwi.perform()
//        
        DispatchQueue.global().async(execute: dwi)
        
    }
}

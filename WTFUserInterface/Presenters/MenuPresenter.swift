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
            var array = Array<MenuModel>()
            let item0 = MenuModel(image: UIImage(named: "80259")!, action: {
                print("item0")
            }, description: "item0", title: "item0")
            array.append(item0)
        }
          
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
}

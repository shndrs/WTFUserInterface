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
            let arrayDet = [ OrderDetails(price: "32.4 US$", title: "Burger"),
                OrderDetails(price: "32.4 US$", title: "Burger"),
                OrderDetails(price: "32.4 US$", title: "Burger"),
                OrderDetails(price: "32.4 US$", title: "Burger"),
                OrderDetails(price: "32.4 US$", title: "Burger")
            ]
            
            var array = Array<MenuModel>()
            let item0 = MenuModel(action: {
                
            }, price: "162 US $", title: "Burger", details: arrayDet)
            
            let item1 = MenuModel(action: {
                
            }, price: "162 US $", title: "Burger", details: arrayDet)
            
            array.append(item0)
            array.append(item1)
            
            
            DispatchQueue.main.async { [weak self] in
                self?.view?.setTableView(with: array)
            }
        }
          
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
}

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
    
    private let price = "32.4 US$"
    private let title = "Cheese Burger"
    
    private weak var view: MenuView?
    
    internal init(view: MenuView) {
        self.view = view
    }
    
    internal func getData() {
        
        let dwi = DispatchWorkItem {
            let arrayDet = [
                OrderDetails(price: self.price, title: self.title),
                OrderDetails(price: self.price, title: self.title),
                OrderDetails(price: self.price, title: self.title),
                OrderDetails(price: self.price, title: self.title),
                OrderDetails(price: self.price, title: self.title)
            ]
            
            var array = Array<MenuModel>()
            let item0 = MenuModel(action: {
                print(self.title)
            }, price: "162 US $", title: self.title, details: arrayDet)
            
            let item1 = MenuModel(action: {
                print(self.title)
            }, price: "162 US $", title: self.title, details: arrayDet)
            
            array.append(item0)
            array.append(item1)
            
            DispatchQueue.main.async { [weak self] in
                self?.view?.setTableView(with: array)
            }
        }
          
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
}

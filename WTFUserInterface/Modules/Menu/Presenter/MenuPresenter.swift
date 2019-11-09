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
    private let totalAmount = "162.0 US$"
    private let title = "Cheese Burger"
    
    private weak var view: MenuView?
    
    internal init(view: MenuView) {
        self.view = view
    }
    
    internal func getData() {
        
        let dwi = DispatchWorkItem { [weak self] in
            
            guard let self = self else { return }
            let rows = self.getRows()
            let sections = self.getSections(rows: rows)
            
            DispatchQueue.main.async { [weak self] in
                self?.view?.setTableView(with: sections)
            }
        }
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
}

// MARK: - Methods

extension MenuPresenter {
    
    private func getRows() -> Array<OrderDetails> {

        var rows = Array<OrderDetails>()

        for _ in 0...4 {
            
            let detail = OrderDetails(price: self.price, title: self.title)
            rows.append(detail)
        }
        return rows
    }
    
    private func getSections(rows: Array<OrderDetails>) -> Array<MenuModel> {
        
        let item0 = MenuModel(action: {
            print(self.title)
        }, price: self.totalAmount, title: self.title, details: rows)
        
        let item1 = MenuModel(action: {
            print(self.totalAmount)
        }, price: "12.39 US$", title: self.title, details: rows)
        
        let array = [item0, item1]
        return array
    }
}

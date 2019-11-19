//
//  SettingsPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol SettingsView: ListView {
    
}

final class SettingsPresenter: NSObject {
    
    private weak var view: SettingsView?
    
    internal init(view: SettingsView) {
        self.view = view
    }

}

// MARK: - Methods

extension SettingsPresenter {
    
    func getItems() {
        
        let dwi = DispatchWorkItem { [weak self] in
            
            guard let items = self?.setItems() else { return }
            
            DispatchQueue.main.async {
                self?.view?.display(items)
            }
        }
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
    
    fileprivate func setItems() -> Array<SettingsModel> {
        
        let cart = SettingsModel(icon: Images.arabica, title: Strings.cart.rawValue) {
        }
        
        let favorites = SettingsModel(icon: Images.robusta, title: Strings.favorites.rawValue) {
        }
        
        let transactions = SettingsModel(icon: Images.excelsa, title: Strings.archive.rawValue) {
        }
        
        let logout = SettingsModel(icon: Images.like, title: Strings.logout.rawValue) {
        }
        
        return [cart, favorites, transactions, logout]
    }
    
    
}

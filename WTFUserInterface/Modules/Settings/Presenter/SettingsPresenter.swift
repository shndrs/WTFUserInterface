//
//  SettingsPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol SettingsView: AnyObject {
    func setTableView(by array: Array<SettingsModel>) -> Void
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
                self?.view?.setTableView(by: items)
            }
        }
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
    
    fileprivate func setItems() -> Array<SettingsModel> {
        let favorites = SettingsModel(icon: Images.newspaper, title: Strings.favorites.rawValue) {
        }
        let favorites1 = SettingsModel(icon: Images.newspaper, title: Strings.settings.rawValue) {
        }
        let favorites2 = SettingsModel(icon: Images.newspaper, title: Strings.news.rawValue) {
        }
        let logout = SettingsModel(icon: Images.like, title: Strings.logout.rawValue) {
        }
        
        return [favorites, favorites1, favorites2, logout]
    }
    
    
}

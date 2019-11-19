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


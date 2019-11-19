//
//  SettingsModel.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

struct SettingsModel {
    
    private(set) var icon: UIImage!
    private(set) var title: String!
    private(set) var action: Action!
    
    init() {}
    
    internal init(icon: UIImage, title: String, action: @escaping Action) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
}

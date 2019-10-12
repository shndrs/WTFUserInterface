//
//  MenuModel.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class MenuModel {
    
    private(set) var image: UIImage!
    private(set) var action: (() -> Void)!
    private(set) var description: String!
    private(set) var title: String!
    
    init(image: UIImage, action: @escaping () -> Void,
         description: String, title: String) {
        self.image = image
        self.action = action
        self.description = description
        self.title = title
    }
}

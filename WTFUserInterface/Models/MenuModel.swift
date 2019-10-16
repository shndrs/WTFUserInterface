//
//  MenuModel.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/8/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class MenuModel {
    
    private(set) var action: (() -> Void)!
    private(set) var price: String!
    private(set) var title: String!
    private(set) var details: Array<OrderDetails>!
    
    init(action: @escaping () -> Void,
        price: String, title: String, details: Array<OrderDetails>) {
        self.action = action
        self.price = price
        self.title = title
        self.details = details
    }
}

final class OrderDetails {
    
    public var price: String!
    public var title: String!
    
    public init(price: String, title:String) {
        self.price = price
        self.title = title
    }
}

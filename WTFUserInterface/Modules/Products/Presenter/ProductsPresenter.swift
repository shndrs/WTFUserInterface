//
//  ProductsPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/30/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol ProductsView: BaseView {
}

final class ProductsPresenter: NSObject {

    private weak var view: ProductsView?
    
    internal init(view: ProductsView) {
        self.view = view
    }
    
}

// MARK: - Methods

extension ProductsPresenter {
    
}

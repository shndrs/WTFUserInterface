//
//  CategoryPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol CategoryView: AnyObject {
    func setTableView(with array: Array<CategoryModel>) -> Void
}

final class CategoryPresenter: NSObject {
    
    private weak var view: CategoryView?
    
    internal init(view: CategoryView) {
        self.view = view
    }
}

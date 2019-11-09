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

// MARK: - Methods

extension CategoryPresenter {
    internal func getItems() {
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            let rows = self.getDetails()
            let sections = self.getSections(rows: rows)
            
            DispatchQueue.main.async {
                self.view?.setTableView(with: sections)
            }
        }
    }
    
    private func getDetails() -> Array<CategoryItems> {
        let details = [
            CategoryItems(title: "Cheese Burger", image: Images.cheeseBurger, description: "18.99 US$"),
            CategoryItems(title: "Special Pizza", image: Images.shrimpPizza, description: "27.99 US$"),
            CategoryItems(title: "Special Beef", image: Images.cheeseBurger, description: "23.99 US$"),
            CategoryItems(title: "Onion Rings", image: Images.shrimpPizza, description: "11.99 US$"),
            CategoryItems(title: "Margarita Pizza", image: Images.shrimpPizza, description: "17.49 US$"),
        ]
        
        return details
    }
    
    private func getSections(rows: Array<CategoryItems>) -> Array<CategoryModel> {
        
        let sections = [
            CategoryModel(sectionTitle: "Burgers", sectionImage: Images.cheeseBurger, items: rows),
            CategoryModel(sectionTitle: "Pizza", sectionImage: Images.shrimpPizza, items: rows),
            CategoryModel(sectionTitle: "Sandwich", sectionImage: Images.sandwich, items: rows),
            CategoryModel(sectionTitle: "Chicken", sectionImage: Images.cheeseBurger, items: rows),
            CategoryModel(sectionTitle: "Potato", sectionImage: Images.sandwich, items: rows),
            CategoryModel(sectionTitle: "Beverage", sectionImage: Images.beverage, items: rows)
        ]
        
        return sections
    }
}

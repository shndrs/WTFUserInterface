//
//  CategoryPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol CategoryView: BaseView {
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
        
        let dwi = DispatchWorkItem { [weak self] in
            
            guard let self = self else { return }
            let rows = self.getDetails()
            let sections = self.getSections(rows: rows)
            
            DispatchQueue.main.async {
                self.view?.setTableView(with: sections)
            }
        }
        DispatchQueue.global(qos: .background).async(execute: dwi)
    }
    
    private func getDetails() -> Array<CategoryItems> {
        
        let details = [
            CategoryItems(title: "Colombia", image: Images.robusta, description: "18.99 US$"),
            CategoryItems(title: "Brazilian", image: Images.excelsa, description: "27.99 US$"),
            CategoryItems(title: "Italian", image: Images.arabica, description: "23.99 US$"),
            CategoryItems(title: "American", image: Images.liberica, description: "11.99 US$"),
            CategoryItems(title: "French", image: Images.excelsa, description: "17.49 US$"),
        ]
        return details
    }
    
    private func getSections(rows: Array<CategoryItems>) -> Array<CategoryModel> {
        
        let sections = [
            CategoryModel(sectionTitle: "Arabica", sectionImage: Images.arabica, items: rows),
            CategoryModel(sectionTitle: "Robusta", sectionImage: Images.robusta, items: rows),
            CategoryModel(sectionTitle: "Liberica", sectionImage: Images.excelsa, items: rows),
            CategoryModel(sectionTitle: "Excelsa", sectionImage: Images.arabica, items: rows),
            CategoryModel(sectionTitle: "Excelsa-Liberica", sectionImage: Images.excelsa, items: rows),
            CategoryModel(sectionTitle: "Robusta-Liberica", sectionImage: Images.liberica, items: rows)
        ]
        
        return sections
    }
}

//
//  CategoryPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol CategoryView: ListView {
    
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
        
        view?.startLoading()
        
        let dwi = DispatchWorkItem { [weak self] in
            
            guard let self = self else { return }
            let rows = self.getDetails()
            let sections = self.getSections(rows: rows)
            
            DispatchQueue.main.async {
                self.view?.setTableView(with: sections)
                self.view?.stopLoading()
            }
        }
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 2, execute: dwi)
    }
    
    private func getDetails() -> Array<CategoryItems> {
        
        let details = [
            CategoryItems(title: "آخرین خبرها", image: Images.robusta, description: "امروز"),
            CategoryItems(title: "گزارش خبری", image: Images.excelsa, description: "اردیبهشت ۳۱"),
            CategoryItems(title: "ایران", image: Images.liberica, description: "اردیبهشت ۳۰"),
            CategoryItems(title: "گزارش‌ها", image: Images.liberica, description: "اردیبهشت ۲۹"),
            CategoryItems(title: "اقتصاد", image: Images.excelsa, description: "اردیبهشت ۲۸"),
        ]
        return details
    }
    
    private func getSections(rows: Array<CategoryItems>) -> Array<CategoryModel> {
        
        let sections = [
            CategoryModel(sectionTitle: "BBC Persia", sectionImage: Images.newspaper, items: rows),
            CategoryModel(sectionTitle: "VOA", sectionImage: Images.newspaper, items: rows),
            CategoryModel(sectionTitle: "رادیو فردا", sectionImage: Images.newspaper, items: rows),
            CategoryModel(sectionTitle: "DW News", sectionImage: Images.newspaper, items: rows)
        ]
        
        return sections
    }
}

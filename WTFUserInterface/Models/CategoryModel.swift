//
//  CategoryModel.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

struct CategoryModel {
    
    var sectionTitle: String!
    var sectionImage: UIImage!
    var items: Array<Category>!
    
    init(sectionTitle: String, sectionImage: UIImage,
         items: Array<Category>) {
        
        self.sectionTitle = sectionTitle
        self.sectionImage = sectionImage
        self.items = items
    }
}

struct Category {
    
    var title: String!
    var image: UIImage!
    var description: String!
    
    init(title: String, image: UIImage, description: String) {
        self.title = title
        self.image = image
        self.description = description
    }
}

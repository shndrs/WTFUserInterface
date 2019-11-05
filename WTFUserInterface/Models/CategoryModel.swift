//
//  CategoryModel.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

struct CategoryModel {
    
    public private(set) var sectionTitle: String!
    public private(set) var sectionImage: UIImage!
    public private(set) var items: Array<Category>!
    
    init(sectionTitle: String, sectionImage: UIImage,
         items: Array<Category>) {
        
        self.sectionTitle = sectionTitle
        self.sectionImage = sectionImage
        self.items = items
    }
}

struct Category {
    
    public private(set) var title: String!
    public private(set) var image: UIImage!
    public private(set) var description: String!
    
    init(title: String, image: UIImage, description: String) {
        self.title = title
        self.image = image
        self.description = description
    }
}

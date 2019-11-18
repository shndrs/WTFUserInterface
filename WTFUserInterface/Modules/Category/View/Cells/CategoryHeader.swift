//
//  CategoryHeader.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class CategoryHeader: UITableViewCell {
    
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.addBorder(color: .darkGray, thickness: 0.5)
        }
    }
    
    @IBOutlet private weak var headerImage: UIImageView! {
        didSet {
            headerImage.addCornerRadius(radius: 5)
        }
    }
    
    @IBOutlet private weak var headerTitle: UILabel!
        
}

// MARK: - Methods

extension CategoryHeader {
    
    internal func fill(cell by: CategoryModel) {
        headerImage.image = by.sectionImage
        headerTitle.text = by.sectionTitle
    }
}

// MARK: - Life Cycle

extension CategoryHeader {
    override func awakeFromNib() {
        super.awakeFromNib()      
    }
}

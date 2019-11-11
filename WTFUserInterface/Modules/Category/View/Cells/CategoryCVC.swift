//
//  CategoryCVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CategoryCVC: UICollectionViewCell, ReusableView {
    
    @IBOutlet private weak var backView: UIView! {
        didSet {
            backView.addCornerRadius(radius: 5)
        }
    }

    @IBOutlet private weak var bannerImage: UIImageView! {
        didSet {
            bannerImage.addCornerRadius(radius: 5)
            bannerImage.clipsToBounds = true
        }
    }
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
}

// MARK: - Methods

extension CategoryCVC {
    internal func fill(cell by: CategoryItems) {
        
        bannerImage.image = by.image
        titleLabel.text = by.title
        descriptionLabel.text = by.description
    }
}

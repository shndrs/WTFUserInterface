//
//  CustomHeader.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/16/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CustomHeader: UITableViewHeaderFooterView {

    @IBOutlet private weak var detailsView: UIView! {
        didSet {
            detailsView.addCornerRadius(radius: 5)
            detailsView.addBorder(color: .darkGray, thickness: 0.5)
        }
    }
    
    @IBOutlet private weak var addressView: UIView! {
        didSet {
            addressView.addCornerRadius(radius: 5)
            addressView.addBorder(color: .darkGray, thickness: 0.5)
        }
    }
    
    @IBOutlet private weak var amountView: UIView! {
        didSet {
            amountView.addCornerRadius(radius: 5)
            amountView.addBorder(color: .white, thickness: 0.5)
        }
    }
    
    public func fill(header by: MenuModel) {
        
    }
    
    
    
}

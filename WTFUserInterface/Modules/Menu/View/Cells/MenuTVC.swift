//
//  MenuTVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class MenuTVC: UITableViewCell, ReusableView {
    
    @IBOutlet private weak var orderTitleLabel: UILabel!
    @IBOutlet private weak var orderCountLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
     
}

// MARK: - Methods

extension MenuTVC {
    internal func fill(cell by: OrderDetails) {
        
        orderTitleLabel.text = by.title
        priceLabel.text = by.price
        orderCountLabel.text = String(2)
    }
}

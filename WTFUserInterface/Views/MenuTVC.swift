//
//  MenuTVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class MenuTVC: UITableViewCell {
    
    @IBOutlet private weak var orderTitleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    
    internal func fill(cell by: MenuModel) {
        
        orderTitleLabel.text = by.title
        priceLabel.text = by.price
    }
}

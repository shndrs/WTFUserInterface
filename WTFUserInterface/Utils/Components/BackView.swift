//
//  BackView.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/27/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class BackgroundView: UIView {
    
    override func awakeFromNib() {
        self.addCornerRadius(radius: 5)
        self.addBorder(color: .darkGray, thickness: 0.5)
    }
}

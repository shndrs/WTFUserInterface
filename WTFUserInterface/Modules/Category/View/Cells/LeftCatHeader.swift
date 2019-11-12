//
//  LeftCatHeader.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class LeftCatHeader: CategoryHeader, ReusableView {

    override var backView: UIView! {
        didSet {
            backView.customCatHeaderLeft()
        }
    }
    
}

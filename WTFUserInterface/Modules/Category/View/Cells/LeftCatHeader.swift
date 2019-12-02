//
//  LeftCatHeader.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/12/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol MoreButtonDelegate: AnyObject {
    func moreButtonPressed()
}

final class LeftCatHeader: CategoryHeader, ReusableView {

    weak var delegate: MoreButtonDelegate?
    
    override var backView: UIView! {
        didSet {
            backView.customCatHeader(leftView: true)
        }
    }
    
    @IBAction func moreButtonPressed(_ sender: UIButton) {
        delegate?.moreButtonPressed()
    }
    
}

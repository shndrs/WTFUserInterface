//
//  CustomHeader.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/16/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public protocol ExpanedCellDelegate: AnyObject {
    
    func expanedButtonPressed(section: Int) -> Void
}

final class CustomHeader: UITableViewCell, NibLoadable, ReusableView {

    internal weak var delegate: ExpanedCellDelegate?
    internal var section: Int!
    
    @IBOutlet private weak var expandButton: UIButton! {
        didSet {
            expandButton.addCornerRadius(radius: 5)
            expandButton.addBorder(color: .white, thickness: 0.6)
        }
    }
    @IBOutlet private weak var backView: UIView! {
        didSet {
            backView.addCornerRadius(radius: 5)
            backView.addBorder(color: .darkGray, thickness: 0.5)
        }
    }
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
    @IBOutlet private weak var expanedButton: UIButton!
}

// MARK: - Methods

extension CustomHeader {
    
    @IBAction private func expanedButtonPressed(_ sender: UIButton) {
        
        delegate?.expanedButtonPressed(section: self.section)
    }
    
    internal func fill(header by: MenuModel) {
        
    }
}

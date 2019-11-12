//
//  NibLoadable.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/16/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol ReusableView {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//
//  NibLoadable.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/16/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {

    static var nibFile: UINib { get }
}

// MARK: Default implementation

public extension NibLoadable {
    
    static var nibFile: UINib {
        return UINib(nibName: String(describing: self),
                     bundle: Bundle(for: self))
    }
}

// MARK: Support for instantiation from NIB

public extension NibLoadable where Self: UIView {
  
    static func loadFromNib() -> Self {
        guard let view = nibFile.instantiate(withOwner: nil,
                                             options: nil).first as? Self else {
            fatalError("The nib \(nibFile) expected its root view to be of type \(self)")
        }
    return view
  }
}

protocol ReusableView {}

extension ReusableView where Self: UIView {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

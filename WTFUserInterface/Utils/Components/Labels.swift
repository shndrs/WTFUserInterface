//
//  Labels.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

// MARK: - Base Label

class BaseLabel: UILabel {
    
    override func awakeFromNib() {
        self.backgroundColor = .white
    }
}

// MARK: - Label Bold

final class LabelBold: BaseLabel {
    
    override func awakeFromNib() {
        self.font = UIFont(name: "AvenirNext-Bold",
                           size: self.font.pointSize)
    }
}

// MARK: - Label Medium

final class LabelMedium: BaseLabel {
    
    override func awakeFromNib() {
        self.font = UIFont(name: "AvenirNext-Medium",
                           size: self.font.pointSize)
    }
}

// MARK: - Label Regular

final class LabelRegular: BaseLabel {
    
    override func awakeFromNib() {
        self.font = UIFont(name: "AvenirNext-Regular",
                           size: self.font.pointSize)
    }
}

// MARK: - Label Light

final class LabelLight: BaseLabel {
    
    override func awakeFromNib() {
        self.font = UIFont(name: "AvenirNext-UltraLight",
                           size: self.font.pointSize)
    }
}
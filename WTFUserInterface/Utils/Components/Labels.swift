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
    
    var fontName: String! //= "AvenirNext-Regular"
    
    override func awakeFromNib() {
        self.backgroundColor = .white
        self.font = UIFont(name: fontName,
                           size: self.font.pointSize)
    }
}

// MARK: - Label Bold

final class LabelBold: BaseLabel {
    
    override func awakeFromNib() {
        fontName = "AvenirNext-Bold"
    }
}

// MARK: - Label Medium

final class LabelMedium: BaseLabel {
    
    override func awakeFromNib() {
        fontName = "AvenirNext-Medium"
    }
}

// MARK: - Label Regular

final class LabelRegular: BaseLabel {
    
    override func awakeFromNib() {
        fontName = "AvenirNext-Regular"
    }
}

// MARK: - Label Light

final class LabelLight: BaseLabel {
    
    override func awakeFromNib() {
        fontName = "AvenirNext-UltraLight"
    }
}

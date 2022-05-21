//
//  Font.swift
//  WTFUserInterface
//
//  Created by NP2 on 12/4/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

enum Font: String {
    
    case bold = "IRANSansMonoSpacedNum-Bold"
    case medium = "IRANSansMonoSpacedNum-Medium"
    case regular = "IRANSansMonoSpacedNum"
    case light = "IRANSansMonoSpacedNum-Light"
    
    func `return`(size: CGFloat) -> UIFont {
        
        switch self {
        
            case .bold:
                return UIFont(name: Font.bold.rawValue, size: size)!
            case .medium:
                return UIFont(name: Font.bold.rawValue, size: size)!
            case .regular:
                return UIFont(name: Font.regular.rawValue, size: size)!
            case .light:
                return UIFont(name: Font.regular.rawValue, size: size)!
        }
    }
    
}

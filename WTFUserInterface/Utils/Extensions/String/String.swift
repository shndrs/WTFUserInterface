//
//  String.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/19/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import Foundation

fileprivate enum StringExtensionShits: String {
    
    case regexEmail = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
    case formatEmail = "SELF MATCHES[c] %@"
}

public extension String {
    
    var isEmailValid: Bool {
        let emailTest = NSPredicate(format: StringExtensionShits.formatEmail.rawValue,
                                    StringExtensionShits.regexEmail.rawValue)
        let matchEmailId = emailTest.evaluate(with: self)
        return matchEmailId
    }
}

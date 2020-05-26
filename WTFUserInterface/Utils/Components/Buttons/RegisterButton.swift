//
//  RegisterButton.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/26/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class RegisterButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - Methods

fileprivate extension RegisterButton {
    
    func config() {
        self.titleLabel?.font = Font.bold.return(size: 15)
        self.backgroundColor = Colors.clear
    }
    
}

//
//  BaseErrorViewController.swift
//  WTFUserInterface
//
//  Created by NP2 on 6/6/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

class BaseErrorViewController: BaseViewController {}

// MARK: - Error View Implementation

extension BaseErrorViewController: ErrorView {
    
    func show(title: String, message: String) {
        AlertManager.default.show(title: title, message: message)
    }
}

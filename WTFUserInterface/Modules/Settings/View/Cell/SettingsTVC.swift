//
//  SettingsTVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SettingsTVC: UITableViewCell, ReusableView {

    @IBOutlet private weak var iconImage: LightCurvedImage!
    @IBOutlet private weak var titleLabel: LabelMedium!
    
}

// MARK: - Methods

extension SettingsTVC {
    
    internal func fill(cell by: SettingsModel) {
        
        iconImage.image = by.icon
        titleLabel.text = by.title
        
    }
}

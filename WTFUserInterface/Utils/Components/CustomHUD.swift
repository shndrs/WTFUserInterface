//
//  CustomHUD.swift
//  WTFUserInterface
//
//  Created by NP2 on 12/30/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import EZProgressHUD

final class HUD: NSObject {
    
    public static let `default` = HUD()
    
    private override init() {}
}

// MARK: - Methods

extension HUD {
    
    public func show() {
        hud().show()
    }
    
    public func dismiss() {
        hud().dismiss(completion: nil)
    }
    
    private func hud() -> EZProgress {
        let options = EZProgressOptions { (option) in
            option.radius = 120
            option.secondLayerStrokeColor = Colors.darkGray
            option.strokeWidth = 12
            option.thirdLayerStrokeColor = Colors.darkGray
            option.firstLayerStrokeColor = .orange
            option.title = Strings.wait.rawValue
            option.animationOption = EZAnimationOptions.antColony
        }
        let hud = EZProgressHUD.setProgress(with: options)
        return hud
    }
}

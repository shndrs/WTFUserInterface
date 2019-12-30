//
//  CustomHUD.swift
//  WTFUserInterface
//
//  Created by NP2 on 12/30/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import EZProgressHUD

class HUD: NSObject {
    
    public static let `default` = HUD()
    
    private lazy var hud: EZProgress = {
        
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
    }()
    
    private override init() {}
    
    func show() {
        hud.show()
    }
    
    func dismiss() {
        hud.dismiss(completion: nil)
    }
    
}

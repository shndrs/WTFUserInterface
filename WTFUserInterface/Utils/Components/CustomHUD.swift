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
            option.radius = 115
            option.firstLayerStrokeColor = UIColor(red: 10/255, green: 101/255, blue: 171/255, alpha: 1.0)
            option.secondLayerStrokeColor = UIColor(red: 10/255, green: 101/255, blue: 171/255, alpha: 1.0)
            option.thirdLayerStrokeColor = .gray
            option.strokeWidth = 2
            option.font = Font.light.return(size: 13)
            option.title = Strings.wait.rawValue
            option.titleTextColor = .white
            option.transViewBackgroundColor = .black
            option.animationOption = EZAnimationOptions.hnk
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

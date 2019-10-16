//
//  UIView.swift
//  WTFUserInterface
//
//  Created by NP2 on 10/16/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

extension UIView {
    
    func addCornerRadius(radius:CGFloat) {
        self.clipsToBounds = true;
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    func addCornerRadius(radius:CGFloat,inset : UIEdgeInsets) {
        let padding = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        self.layer.frame = bounds.inset(by: padding)
        self.layer.cornerRadius = CGFloat(radius)
    }
    
    func addBorder(color: UIColor = UIColor.white, thickness: CGFloat = 1.0) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = thickness
    }
    
    func addShadow(offset:CGSize,opacity:Float,shadowColor:UIColor,radius:CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }
}

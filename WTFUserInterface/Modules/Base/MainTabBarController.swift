//
//  MainTabBarController.swift
//  WTFUserInterface
//
//  Created by NP2 on 3/11/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit
import SwiftyTabBarTransition

final class MainTabBarController: UITabBarController {
    
    private var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: Strings.transformScale.rawValue)
        bounceAnimation.values = [1.0, 1.1, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode(rawValue: Strings.cubic.rawValue)
        return bounceAnimation
    }()
}

// MARK: - Life Cycle

extension MainTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let transitionOptions:SwiftyTabBarTransitionOptions!
        
        transitionOptions = tabBar.selectedItem == tabBar.items?[0] ?
            SwiftyTabBarTransitionOptions(duration: 0.3,
                                          animationOption: .leftToRight)
            :
            SwiftyTabBarTransitionOptions(duration: 0.3,
                                            animationOption: .rightToLeft)
        
        return SwiftyTabBarTransition.set(transition: transitionOptions)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1,
            let imageView = tabBar.subviews[idx + 1].subviews.compactMap ({ $0 as? UIImageView }).first else {
            return
        }
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
}

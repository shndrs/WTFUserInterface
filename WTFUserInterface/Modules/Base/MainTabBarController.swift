//
//  MainTabBarController.swift
//  WTFUserInterface
//
//  Created by NP2 on 3/11/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit
import SwiftyTabBarTransition

final class MainTabBarController: UITabBarController {}

// MARK: - Life Cycle

extension MainTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

// MARK: - Methods

extension MainTabBarController {
    func setTransition() {
        
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let transitionOptions:SwiftyTabBarTransitionOptions!
        
        transitionOptions = tabBar.selectedItem == tabBar.items?[0] ?
            SwiftyTabBarTransitionOptions(duration: 0.3,
                                          animationOption: .leftToRight)
            : SwiftyTabBarTransitionOptions(duration: 0.3,
                                            animationOption: .rightToLeft)
        
        return SwiftyTabBarTransition.set(transition: transitionOptions)
    }
}

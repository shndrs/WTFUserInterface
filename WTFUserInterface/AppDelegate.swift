//
//  AppDelegate.swift
//  WTFUserInterface
//
//  Created by Sahand Raeisi on 9/27/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        KeyboardManager.applyConfig()
        return true
    }
}


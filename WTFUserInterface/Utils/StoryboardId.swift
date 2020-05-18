//
//  StoryboardId.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/4/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

public enum StoryboardId: String {
    
    case main = "Main"
    case login = "Login"
    case register = "Register"
}

// MARK: - Methods

extension StoryboardId {
    public func raw() -> String {
        switch self {
        case .main:
            return StoryboardId.main.rawValue
        case .login:
            return StoryboardId.login.rawValue
        case .register:
            return StoryboardId.register.rawValue
        }
    }
}

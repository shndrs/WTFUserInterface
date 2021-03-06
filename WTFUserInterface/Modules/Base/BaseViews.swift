//
//  BaseViews.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

protocol BaseView: AnyObject {}

protocol ErrorView: AnyObject {
    func show(title: String, message: String)
}

protocol ServiceView: BaseView {
    
    func startLoading() -> Void
    func stopLoading() -> Void
}

protocol ListView: ServiceView {}

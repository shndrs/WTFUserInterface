//
//  BaseViews.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import Foundation

protocol ListView: AnyObject {
    func display<T:Any>(_ items : [T]) -> Void
}

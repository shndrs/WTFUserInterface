//
//  FavoritesPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

protocol FavoritesView: ListView {
    
}

final class FavoritesPresenter: NSObject {

    private weak var view: FavoritesView?
    
    internal init(view: FavoritesView) {
        self.view = view
    }
    
}

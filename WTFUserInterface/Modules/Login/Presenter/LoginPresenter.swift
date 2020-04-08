//
//  LoginPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 4/8/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

protocol LoginView: BaseView {
    func loggedInSuccessfully()
}

final class LoginPresenter: NSObject {

    private weak var view: LoginView?
    
    public init(view: LoginView) {
        self.view = view
    }
    
}

// MARK: - Methods

extension LoginPresenter {
    public func validate(object: Login) {
        if !object.username.isEmpty && !object.password.isEmpty {
            login()
        }
    }
    
    private func login() {
        self.view?.loggedInSuccessfully()
    }
}

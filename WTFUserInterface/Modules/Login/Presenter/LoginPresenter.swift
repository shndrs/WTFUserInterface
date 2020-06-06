//
//  LoginPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 4/8/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

protocol LoginView: ServiceView, ErrorView {
    func loggedInSuccessfully()
}

final class LoginPresenter: NSObject {
    
    private lazy var database: Defaults = {
        return Defaults()
    }()

    private weak var view: LoginView?
    
    public init(view: LoginView) {
        self.view = view
    }
}

// MARK: - Methods

extension LoginPresenter {
    
    public func validate(object: Login) {
        
        if object.username != database[DefaultsKeys.username.rawValue] {
            if object.username != database[DefaultsKeys.email.rawValue] {
                view?.show(title: Strings.error.rawValue,
                           message: Strings.inCorrectPassUser.rawValue)
            }
        } else if object.password != database[DefaultsKeys.password.rawValue] {
            view?.show(title: Strings.error.rawValue,
                       message: Strings.inCorrectPassUser.rawValue)
        } else {
            view?.loggedInSuccessfully()
        }
    }
    
    private func login() {
        self.view?.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) { [weak self] in
            guard self != nil else { return }
            self?.view?.stopLoading()
            self?.view?.loggedInSuccessfully()
        }
    }
}

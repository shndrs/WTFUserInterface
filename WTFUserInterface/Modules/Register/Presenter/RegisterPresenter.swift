//
//  RegisterPresenter.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class RegisterPresenter: RegisterViewToPresenterProtocol {
    
    var view: RegisterPresenterToViewProtocol?
    var interactor: RegisterPresenterToInteractorProtocol?
    var router: RegisterRouterProtocol?
    
    public init(view: RegisterPresenterToViewProtocol?,
                interactor: RegisterPresenterToInteractorProtocol?,
                router: RegisterRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func goToLogin(fromNavigationController nav: UINavigationController) {
        router?.goToLogin(fromNavigationController: nav)
    }
    
    func validate(inputs: RegisterEntity) {
        if inputs.username.isEmpty {
            self.view?.show(error: "username.isEmpty")
        } else if inputs.password.isEmpty {
            self.view?.show(error: "inputs.password.isEmpty")
        } else if inputs.repeatPassword.isEmpty {
            self.view?.show(error: "inputs.repeatPassword.isEmpty")
        } else if inputs.email.isEmpty {
            self.view?.show(error: "inputs.email.isEmpty")
        } else {
            interactor?.saveUserInfo(with: inputs)
        }
    }
}

// MARK: - Iteractor To Presenter

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    
}

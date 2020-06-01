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
            self.view?.show(error: Strings.usernameIsEmpty.rawValue)
        } else if inputs.password.isEmpty {
            self.view?.show(error: Strings.passIsEmpty.rawValue)
        } else if inputs.repeatPassword.isEmpty {
            self.view?.show(error: Strings.repeatPassIsEmpty.rawValue)
        } else if inputs.password != inputs.repeatPassword {
            self.view?.show(error: Strings.repeatPassIsNotEqual.rawValue)
        } else if !inputs.email.isEmailValid {
            self.view?.show(error: Strings.emailIsInvalid.rawValue)
        } else {
            interactor?.saveUserInfo(with: inputs)
        }
    }
}

// MARK: - Iteractor To Presenter

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    func registerSuccessfully() {
        view?.registerSuccessfully()
    }
}

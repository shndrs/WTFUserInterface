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
    
    func goToLogin(fromNavigationController nav: UINavigationController) {
        router?.goToLogin(fromNavigationController: nav)
    }
    
}

// MARK: - Iteractor To Presenter

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    
}

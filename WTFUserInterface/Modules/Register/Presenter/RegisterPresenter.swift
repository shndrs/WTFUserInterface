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
    
}

// MARK: - Iteractor To Presenter

extension RegisterPresenter: RegisterInteractorToPresenterProtocol {
    
}

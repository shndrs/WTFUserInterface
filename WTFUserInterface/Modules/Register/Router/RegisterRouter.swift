//
//  RegisterRouter.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class RegisterRouter {
    
    weak var view: RegisterVC?
}

// MARK: - Router Implementation

extension RegisterRouter: RegisterRouterProtocol {
    
    static func createModule() -> RegisterVC {
        
        let view = RegisterVC.instantiate(storyboard: .register)
        let interactor = RegisterInteractor()
        let router = RegisterRouter()
        let presenter = RegisterPresenter(view: view,
                                          interactor: interactor,
                                          router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        return view
    }
    
    func goToLogin(fromNavigationController nav: UINavigationController) {
        view?.navigationController?.popViewController(animated: true)
    }
    
}

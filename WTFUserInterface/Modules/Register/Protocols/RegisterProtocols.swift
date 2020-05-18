//
//  RegisterProtocols.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

protocol RegisterViewToPresenterProtocol: AnyObject {
    var view: RegisterPresenterToViewProtocol? { get set }
    var interactor: RegisterPresenterToInteractorProtocol? { get set }
    var router: RegisterRouterProtocol? { get set }
    
    func goToLogin(fromNavigationController nav: UINavigationController)
    func validate(inputs: RegisterEntity)
}

protocol RegisterPresenterToViewProtocol: AnyObject {
    func show(error: String)
    func registerSuccessfully()
}

protocol RegisterRouterProtocol: AnyObject {
    static func createModule() -> RegisterVC
    func goToLogin(fromNavigationController nav: UINavigationController)
}

protocol RegisterPresenterToInteractorProtocol: AnyObject {
    func saveUserInfo(with object: RegisterEntity)
}

protocol RegisterInteractorToPresenterProtocol: AnyObject {
    func registerSuccessfully()
}

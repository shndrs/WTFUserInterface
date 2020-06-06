//
//  RegisterInteractor.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import Foundation

final class RegisterInteractor {
    
    private lazy var database: Defaults = {
        return Defaults()
    }()
    var presenter: RegisterInteractorToPresenterProtocol?
}

// MARK: - Presenter To Interactor

extension RegisterInteractor: RegisterPresenterToInteractorProtocol {
    
    func saveUserInfo(with object: RegisterEntity) {
        database[DefaultsKeys.username.rawValue] = object.username
        database[DefaultsKeys.password.rawValue] = object.password
        database[DefaultsKeys.email.rawValue] = object.email
        presenter?.registerSuccessfully()
    }
}

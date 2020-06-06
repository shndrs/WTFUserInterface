//
//  RegisterVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class RegisterVC: BaseViewController {
    
    public var presenter: RegisterViewToPresenterProtocol?
    
}

// MARK: - Methods

extension RegisterVC {
    @IBAction private func registerButtonPressed(_ sender: Any) {
        let object = RegisterEntity()
        presenter?.validate(inputs: object)
    }
}

// MARK: - Life Cycle

extension RegisterVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.register.rawValue
    }
}

// MARK: - Presenter to View Implementation

extension RegisterVC: RegisterPresenterToViewProtocol {
    func registerSuccessfully() {
        guard let nav = self.navigationController else { return }
        presenter?.goToLogin(fromNavigationController: nav)
    }
    
    func show(error: String) {
        
    }
}

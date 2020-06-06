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
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var repeatPasswordTextField: UITextField!
    
}

// MARK: - Methods

extension RegisterVC {
    @IBAction private func registerButtonPressed(_ sender: SubmitButton) {
        let object = RegisterEntity(username: userNameTextField.text ?? "",
                                    password: passwordTextField.text ?? "",
                                    repeatPassword: repeatPasswordTextField.text ?? "",
                                    email: emailTextField.text ?? "")
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

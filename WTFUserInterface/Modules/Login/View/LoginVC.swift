//
//  LoginVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 4/8/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class LoginVC: BaseViewController {

    private lazy var presenter: LoginPresenter = {
        return LoginPresenter(view: self)
    }()
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
}

// MARK: - Methods

extension LoginVC {
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        
    }
}

// MARK: - Life Cycle

extension LoginVC {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - View Implementation

extension LoginVC: LoginView {
    func loggedInSuccessfully() {
        
    }
}

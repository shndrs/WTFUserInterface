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
    
    @IBOutlet private var backgroundImage: UIImageView! {
        didSet {
            backgroundImage.image = Images.login
        }
    }
    
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
}

// MARK: - Methods

extension LoginVC {
    @IBAction private func loginButtonPressed(_ sender: UIButton) {
        let object = Login(username: userNameTextField.text ?? "",
                           password: userNameTextField.text ?? "")
        presenter.validate(object: object)
    }
}

// MARK: - Life Cycle

extension LoginVC {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

// MARK: - View Implementation

extension LoginVC: LoginView {
    func startLoading() {
        HUD.default.show()
    }
    
    func stopLoading() {
        HUD.default.dismiss()
    }
    
    func loggedInSuccessfully() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let viewController = storyboard
            .instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else {
            return
        }
        self.show(viewController, sender: nil)
    }
}

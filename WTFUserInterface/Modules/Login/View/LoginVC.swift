//
//  LoginVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 4/8/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class LoginVC: BaseErrorViewController {

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
                           password: passwordTextField.text ?? "")
        presenter.validate(object: object)
    }
    
    @IBAction private func registerButtonPressed(_ sender: RegisterButton) {
        let viewController = RegisterRouter.createModule()
        show(viewController, sender: nil)
    }
}

// MARK: - Life Cycle

extension LoginVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Strings.login.rawValue
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
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
        let viewController = MainTabBarController.instantiate(storyboard: .main)
        self.show(viewController, sender: nil)
    }
}

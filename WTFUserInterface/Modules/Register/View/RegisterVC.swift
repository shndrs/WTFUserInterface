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
    }
}

// MARK: - Life Cycle

extension RegisterVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Presenter to View Implementation

extension RegisterVC: RegisterPresenterToViewProtocol {
    func show(error: String) {
        
    }
}

//
//  AlertManager.swift
//  WTFUserInterface
//
//  Created by NP2 on 5/18/20.
//  Copyright © 2020 shndrs. All rights reserved.
//

import UIKit

final class AlertManager {
    
    static let `default` = AlertManager()
    
    private init() {}
}

// MARK: - Methods

extension AlertManager {

    public func show(title: String, yesBlock: @escaping () -> Void) {
        
        let alertController = UIAlertController(title: Strings.areYouSure.rawValue,
                                                message: title,
                                                preferredStyle: .alert)
        let no = UIAlertAction(title: Strings.no.rawValue,
                               style: .destructive) {
            (action) in
            alertController.dismiss(animated: true)
        }
        let yes = UIAlertAction(title: Strings.yes.rawValue,
                                style: .default) {
            (action) in
            yesBlock()
        }
        alertController.addAction(no)
        alertController.addAction(yes)
        alertController.view.tintColor = .gray
        topViewController()?.present(alertController, animated: true)
    }
    
    private func topViewController() -> UIViewController? {
        
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}

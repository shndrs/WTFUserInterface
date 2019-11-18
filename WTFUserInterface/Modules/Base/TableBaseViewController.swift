//
//  TableBaseViewController.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/18/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

class TableBaseViewController: UIViewController {
    
    @IBOutlet internal weak var tableView: UITableView! {
        didSet {
            tableSetup()
        }
    }
    
}

// MARK: - Methods

extension TableBaseViewController {
    @objc func tableSetup() {
        tableView.cleanFooterView()
    }
    
    func register(reuseIds: Array<String>) {
        
        for id in reuseIds {
            Register.in(component: tableView, id: id)
        }
    }
}

// MARK: - Life Cycle

extension TableBaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//
//  CategoryVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CategoryVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableViewSetup()
        }
    }
}

// MARK: - Methods

fileprivate extension CategoryVC {
    func tableViewSetup() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.cleanFooterView()
    }
}

// MARK: - Life Cycle

extension CategoryVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table View Implementation

extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//
//  SettingsVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SettingsVC: TableBaseViewController {

    

}

// MARK: - Life Cycle

extension SettingsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTitle = true
    }
}

// MARK: - Methods

extension SettingsVC {
    override func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - TableView Implementation

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

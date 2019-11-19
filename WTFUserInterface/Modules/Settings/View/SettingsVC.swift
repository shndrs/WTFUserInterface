//
//  SettingsVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class SettingsVC: TableBaseViewController {

    private lazy var items: Array<SettingsModel> = {
        return Array<SettingsModel>()
    }()
    
    private lazy var presenter: SettingsPresenter = {
        return SettingsPresenter(view: self)
    }()

}

// MARK: - Life Cycle

extension SettingsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTitle = true
        presenter.getItems()
    }
}

// MARK: - Methods

extension SettingsVC {
    override func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        tableView.cleanFooterView()
        register(reuseIds: RIDs.settingsVC)
    }
}

// MARK: - View Implementation

extension SettingsVC: SettingsView {
    
    func display<T>(_ items: [T]) {
        
        if let items = items as? Array<SettingsModel> {
            self.items = items
            self.tableView.asyncReload()
        }
    }
}

// MARK: - TableView Implementation

extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? (items.count - 1) : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTVC.reuseIdentifier) as? SettingsTVC
        
        if indexPath.section == 0 {
            cell?.fill(cell: items[indexPath.row])
        } else {
            cell?.fill(cell: items.last ?? SettingsModel())
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return UIView().emptyView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (section == 0) ? 0:36
    }
}

//
//  FavoritesVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/19/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class FavoritesVC: TableBaseViewController {

    private lazy var items: Array<CategoryItems> = {
        return Array<CategoryItems>()
    }()
    
    private lazy var presenter: FavoritesPresenter = {
        return FavoritesPresenter(view: self)
    }()
    
}

// MARK: - Methods

extension FavoritesVC {
    override func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Life Cycle

extension FavoritesVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - View Implementation

extension FavoritesVC: FavoritesView {
    
    func setTableView(by array: Array<CategoryItems>) {
        self.items = array
        self.tableView.asyncReload()
    }
}

// MARK: - TableView Implementation

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

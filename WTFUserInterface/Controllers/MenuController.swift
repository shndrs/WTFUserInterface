//
//  MenuController.swift
//  WTFUserInterface
//
//  Created by NP2 on 9/28/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class MenuController: UIViewController {
    
    private lazy var items: Array<MenuModel> = {
        return Array<MenuModel>()
    }()
    
    private lazy var presenter: MenuPresenter = {
        return MenuPresenter(view: self)
    }()
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
}

// MARK: - Life Cycle

extension MenuController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: - View Implementation

extension MenuController: MenuView {
    func setTableView(with array: Array<MenuModel>) {
        items = array
        tableView.asyncReload()
    }
}

// MARK: - TableView DataSource and Delegate

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

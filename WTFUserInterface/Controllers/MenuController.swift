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
            tableView.sectionFooterHeight = 39.0
            tableView.cleanFooterView()
            tableView.registerCell(with: Ids.menuTVC.rawValue)
            tableView.registerCell(with: Ids.bannerTVC.rawValue)
            tableView.register(CustomHeader.self)
        }
    }
}

// MARK: - Life Cycle

extension MenuController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getData()
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items[section].details.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView
            .dequeueReusableCell(withIdentifier: Ids.menuTVC.rawValue) as! MenuTVC
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        return 284
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView
            .dequeueReusableCell(withIdentifier: CustomHeader.reuseIdentifier) as! CustomHeader
        view.delegate = self
        view.section = section
        view.fill(header: items[section])
        return view
    }
}

// MARK: - Expaned Button Delegate

extension MenuController: ExpanedCellDelegate {
    func expanedButtonPressed(section: Int) {
        
        var indexPaths = Array<IndexPath>()
        let details = items[section].details.count
        for row in 0..<details {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let isExpanded = items[section].isExpanded
        items[section].isExpanded = !isExpanded
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .automatic)
        } else {
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
}

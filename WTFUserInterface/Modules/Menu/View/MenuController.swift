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
            tableSetup()
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

// MARK: - Methods

extension MenuController {
    
    fileprivate func getIndexPaths(section: Int) -> Array<IndexPath> {
        
        var indexPaths = Array<IndexPath>()
        let details = items[section].details.count
        for row in 0..<details {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        return indexPaths
    }
    
    fileprivate func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionFooterHeight = 39.0
        tableView.sectionHeaderHeight = 302
        tableView.rowHeight = 40
        tableView.cleanFooterView()
        Register.in(component: tableView, id: MenuTVC.reuseIdentifier)
        Register.in(component: tableView, id: CustomHeader.reuseIdentifier)
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
        let rowsCount = (items[section].isExpanded == false)
            ? 0 : items[section].details.count
        return rowsCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView
            .dequeueReusableCell(withIdentifier: Ids.menuTVC.rawValue) as! MenuTVC
        cell.fill(cell: items[indexPath.section].details[indexPath.row])
        return cell
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
        
        let indexPaths = getIndexPaths(section: section)
        
        let isExpanded = items[section].isExpanded
        items[section].isExpanded = !isExpanded
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .automatic)
        } else {
            tableView.insertRows(at: indexPaths, with: .automatic)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.18) {
            self.tableView.reloadData()
        }
    }
}

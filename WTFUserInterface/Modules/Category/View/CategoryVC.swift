//
//  CategoryVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CategoryVC: UIViewController {
    
    private lazy var presenter: CategoryPresenter = {
        return CategoryPresenter(view: self)
    }()
    
    private lazy var items: Array<CategoryModel> = {
        return Array<CategoryModel>()
    }()

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
        tableView.rowHeight = 165.0
        tableView.sectionHeaderHeight = 52.0
        Register.in(component: tableView, id: CategoryHeader.reuseIdentifier)
        Register.in(component: tableView, id: CategoryTVC.reuseIdentifier)
        tableView.cleanFooterView()
    }
}

// MARK: - Life Cycle

extension CategoryVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.getItems()
    }
}

// MARK: - View Implementation

extension CategoryVC: CategoryView {
    func setTableView(with array: Array<CategoryModel>) {
        self.items = array
        tableView.asyncReload()
    }
}

// MARK: - Table View Implementation

extension CategoryVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: CategoryTVC.reuseIdentifier) as? CategoryTVC
            else {
                return UITableViewCell()
        }
        
        cell.fill(cell: items[indexPath.row].items)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView
            .dequeueReusableCell(withIdentifier: CategoryHeader.reuseIdentifier) as? CategoryHeader
            else {
                return UITableViewCell()
        }
        header.fill(cell: items[section])
        return header
    }
}

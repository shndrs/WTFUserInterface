//
//  CategoryVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/5/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class CategoryVC: TableBaseViewController {
    
    private lazy var presenter: CategoryPresenter = {
        return CategoryPresenter(view: self)
    }()
    
    private lazy var menuButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .refresh,
                               target: self,
                               action: #selector(barButtonPressed))
    }()
    
    private lazy var items: Array<CategoryModel> = {
        return Array<CategoryModel>()
    }()

}

// MARK: - Methods

extension CategoryVC {
    
    @objc fileprivate func barButtonPressed() {
        presenter.getItems()
    }
    
    fileprivate func searchSetup() {
//        let searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
    }
    
    override func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        register(reuseIds: RIDs.categoryVC)
    }
}

// MARK: - Life Cycle

extension CategoryVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTitle = true
        searchSetup()
        self.title = Strings.news.rawValue
        navigationItem.setRightBarButton(menuButton, animated: true)
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
        
        if indexPath.section != 0 {
            let cell = tableView
                .dequeueReusableCell(withIdentifier: CategoryTVC.reuseIdentifier) as? CategoryTVC
            cell?.fill(cell: items[indexPath.row].items)
            return cell ?? UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let topHeader = tableView.dequeueReusableCell(withIdentifier: CatSliderTVC.reuseIdentifier) as? CatSliderTVC
            return topHeader
        } else if section % 2 == 1 {
            let headerLeft = tableView.dequeueReusableCell(withIdentifier: LeftCatHeader.reuseIdentifier) as? LeftCatHeader
            headerLeft?.fill(cell: items[section])
            headerLeft?.delegate = self
            return headerLeft
        } else {
            let headerRight = tableView.dequeueReusableCell(withIdentifier: RightCatHeader.reuseIdentifier) as? RightCatHeader
            headerRight?.fill(cell: items[section])
            return headerRight
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return (section != 0) ? 45:240
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.section == 0) ? 0:165.0
    }
}

// MARK: - More Button Delegate

extension CategoryVC: MoreButtonDelegate {
    func moreButtonPressed() {
        
    }
}

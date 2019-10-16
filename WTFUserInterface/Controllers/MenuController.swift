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
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (section == 0) ? 1 : items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Ids.menuTVC.rawValue) as! MenuTVC
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.section == 0) ? 230 : 130
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Ids.customHeader.rawValue) as! CustomHeader
        
        
        
        
        let view = HeaderLabel()
        view.backgroundColor = .white
        view.text = (section == 0) ? "  Ibanez Prestige Series" : "  Specs"
        return view
    }
}

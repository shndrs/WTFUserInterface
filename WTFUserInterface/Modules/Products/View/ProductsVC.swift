//
//  ProductsVC.swift
//  WTFUserInterface
//
//  Created by NP2 on 11/30/19.
//  Copyright © 2019 shndrs. All rights reserved.
//

import UIKit

final class ProductsVC: TableBaseViewController {

    private lazy var presenter: ProductsPresenter = {
        return ProductsPresenter(view: self)
    }()
    
}

// MARK: - Methods

extension ProductsVC {
    override func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Life Cycle

extension ProductsVC {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - View Implementation

extension ProductsVC: ProductsView {
    
}

// MARK: - TableView Implementation

extension ProductsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

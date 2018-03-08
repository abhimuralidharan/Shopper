//
//  ViewController.swift
//  Shopper
//
//  Created by Apple on 02/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var listTableView: UITableView!
    var cartButton : MJBadgeBarButton!
    
    //MARK:- Variables
    private var cartItemManager: ItemManager!
    private var listScreenViewModel: ListScreenViewModel!
    private var cartItemsViewModel: CartItemsViewModel!
    
    private (set) var dataSource :TableViewDataSource<ListTableViewCell,ItemListViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartItemManager = ItemManager()
        cartItemsViewModel = CartItemsViewModel()
        listScreenViewModel = ListScreenViewModel(cartItemManager: cartItemManager)
        listScreenViewModel.populateItems {
            self.setupTableViewDataSource()
            self.listTableView.reloadData()
        }
        listTableView.estimatedRowHeight = 100
        listTableView.rowHeight = UITableViewAutomaticDimension
        setupCartButton()
        view.makeToast("Tap item to add item to cart")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cartButton.badgeValue = "\(cartItemsViewModel.getBadgeCount())"
    }
    private func setupCartButton() {
        let customButton = UIButton(type: UIButtonType.custom)
        customButton.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
        customButton.addTarget(self, action: #selector(self.openCartAction(_:)), for: .touchUpInside)
        customButton.setImage(#imageLiteral(resourceName: "shopping-cart"), for: .normal)
        
        cartButton = MJBadgeBarButton()
        cartButton.setup(customButton: customButton)
        cartButton.badgeValue = "0"
        cartButton.badgeOriginX = 20.0
        cartButton.badgeOriginY = -4
        
        self.navigationItem.rightBarButtonItem = cartButton
    }
    private func setupTableViewDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: Constants.CELL_IDENTIFIERS.HOME_SCREEN_TABLEVIEWCELL, items: self.listScreenViewModel.itemDataArray, configureCell: { (cell, modelObj) in
            cell.configureCell(modelObj: modelObj)
        })
        self.listTableView.dataSource = self.dataSource
        self.listTableView.delegate = self
    }
    @IBAction func openCartAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showCartSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCartSegue", let navVc = segue.destination as? UINavigationController,let vc = navVc.viewControllers.first as? CartViewController {
            vc.cartItemsViewModel = cartItemsViewModel
        }
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemSelected = listScreenViewModel.itemfor(indexpath: indexPath)
        view.makeToast("\(itemSelected.itemQuantity) quantities of \(itemSelected.itemTitle) added to cart")
        cartItemsViewModel.add(itemSelected)
        cartButton.badgeValue = "\(cartItemsViewModel.getBadgeCount())"
    }
}


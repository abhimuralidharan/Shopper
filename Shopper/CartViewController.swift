//
//  CartViewController.swift
//  Shopper
//
//  Created by Apple on 03/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var noDataLabel: UILabel!
    private var cartItemManager: ItemManager!
    private var cartScreenViewModel: CartScreenViewModel!
    var cartItemsViewModel: CartItemsViewModel!
    private (set) var dataSource :TableViewDataSource<ListTableViewCell,ItemListViewModel>!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        cartItemManager = ItemManager()
        cartScreenViewModel = CartScreenViewModel(cartItemsViewModel: cartItemsViewModel)
        setupTableViewDataSource()
        checkNovalueStatus()
        setTotalAmount()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !cartItemsViewModel.cartItemsArray.isEmpty {
            view.makeToast("Tap item to remove from cart")
        }
    }
    private func setupTableViewDataSource() {
        dataSource = TableViewDataSource(cellIdentifier: Constants.CELL_IDENTIFIERS.HOME_SCREEN_TABLEVIEWCELL, items: self.cartItemsViewModel.cartItemsArray, configureCell: { (cell, modelObj) in
            cell.configureCell(modelObj: modelObj)
        })
        self.cartTableView.dataSource = self.dataSource
        self.cartTableView.delegate = self
    }
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        closeView()
    }
    @IBAction func checkoutButtonAction(_ sender: UIBarButtonItem) {
        guard !cartItemsViewModel.cartItemsArray.isEmpty else {
            view.makeToast("Your cart is empty")
            return
        }
        cartItemsViewModel.cartItemsArray.removeAll()
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            window.makeToast("Purchased successfully for \(totalAmountLabel.text!)")
        }
        closeView()
    }
    private func closeView() {
        dismiss(animated: true, completion: nil)
    }
}
extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemSelected = cartScreenViewModel.itemfor(indexpath: indexPath)
        view.hideAllToasts()
        view.makeToast("\(itemSelected.itemQuantity) quantities of \(itemSelected.itemTitle) removed from cart.")
        cartItemsViewModel.remove(itemid: itemSelected.itemid)
        setupTableViewDataSource()
        cartTableView.reloadData()
        checkNovalueStatus()
        setTotalAmount()
    }
    func setTotalAmount() {
        totalAmountLabel.text = cartScreenViewModel.getTotalAmount()
    }
    func checkNovalueStatus() {
        cartScreenViewModel.shouldShowEmptyDataLabel { [weak self](labelShowStatus) in
            self?.noDataLabel.isHidden = labelShowStatus
            self?.cartTableView.isHidden = !labelShowStatus
        }
    }
}


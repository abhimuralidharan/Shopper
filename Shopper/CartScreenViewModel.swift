//
//  CartScreenViewModel.swift
//  Shopper
//
//  Created by Apple on 03/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import Foundation

class CartScreenViewModel {
    
    var cartItemsViewModel: CartItemsViewModel!
    
    init(cartItemsViewModel:CartItemsViewModel) {
        self.cartItemsViewModel = cartItemsViewModel
    }
    
    func itemfor(indexpath:IndexPath)->ItemListViewModel {
        return cartItemsViewModel.cartItemsArray[indexpath.row]
    }
    
    func shouldShowEmptyDataLabel(completion:(Bool)->()) {
        completion(!cartItemsViewModel.cartItemsArray.isEmpty)
    }
    
    func getTotalAmount()-> String {
        guard !cartItemsViewModel.cartItemsArray.isEmpty else {
            return "0.00"
        }
        let amount = cartItemsViewModel.cartItemsArray.reduce(0) { $1.itemAmount + $0 }
        return "\(amount)" + " \(cartItemsViewModel.cartItemsArray.first!.itemCurrency)"
    }
}

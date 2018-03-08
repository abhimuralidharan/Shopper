//
//  CartItemViewModel.swift
//  Shopper
//
//  Created by Apple on 04/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import Foundation
class CartItemsViewModel {
    var cartItemsArray = [ItemListViewModel]()
    
    func add(_ item: ItemListViewModel?) {
        guard let item = item else {
            print("Failed to add item to cart. Selected item not available")
            return
        }
        cartItemsArray.append(item)
    }
    
    func remove(itemid:String?) {
        guard !cartItemsArray.isEmpty else {
            print("Cart is empty")
            return
        }
        guard let itemidStr = itemid, !itemidStr.isEmpty else {
            print("Failed to remove item from cart. Itemid missing")
            return
        }
        guard cartItemsArray.contains(where: { $0.itemid == itemidStr }) else {
            print("Failed to remove item from cart. Invalid itemid")
            return
        }
        
        if let i = cartItemsArray.index(where: { $0.itemid == itemidStr }) {
            cartItemsArray.remove(at: i)
        } else {
            print("Failed to remove item from cart. Invalid itemid")
        }
        
    }
    func getBadgeCount() -> Int {
        return cartItemsArray.count
    }
}



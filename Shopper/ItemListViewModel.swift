//
//  ItemListViewModel.swift
//  Shopper
//
//  Created by Apple on 03/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import Foundation

class ItemListViewModel {
    var itemTitle: String
    var itemCurrency: String
    var itemAmount: Int
    var itemImage: String
    var itemQuantity: Int
    var itemid: String
    
    init(item: CartItem) {
        itemTitle = item.itemTitle
        itemCurrency = item.itemCurrency
        itemAmount = item.itemAmount
        itemImage = item.itemImage
        itemQuantity = item.itemQuantity
        itemid = item.itemid
    }
}


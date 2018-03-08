//
//  ListScreenViewModel.swift
//  Shopper
//
//  Created by Apple on 03/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import Foundation

class ListScreenViewModel {
    private var cartItemManager: ItemManager
    private (set) var itemDataArray = [ItemListViewModel]()
    
    init(cartItemManager :ItemManager) {
        self.cartItemManager = cartItemManager
    }
    func populateItems(completion:@escaping () -> ()) {
        self.cartItemManager.loadItemsFromPlist{ items in
            self.itemDataArray = items.map(ItemListViewModel.init)
            completion()
        }
    }
    
    func itemfor(indexpath:IndexPath)->ItemListViewModel {
        return itemDataArray[indexpath.row]
    }
    
}


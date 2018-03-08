//
//  CartItemManager.swift
//  Shopper
//
//  Created by Apple on 02/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import Foundation

class ItemManager {
    var cartItemsArray = [CartItem]()
    
    func loadItemsFromPlist(completion : @escaping ([CartItem]) -> ()) {
        if let plistURL = Bundle.main.url(forResource: "ShoppingData", withExtension: "plist") {
            if let plistDataArray = NSArray.init(contentsOf: plistURL) as? [[String:Any]] {
                var returnArray = [CartItem]()
                for item in plistDataArray {
                    if let cartItem = CartItem(dict: item) {
                        returnArray.append(cartItem)
                    }
                }
                completion(returnArray)
            }
        }
    }
    
}


//
//  CartItem.swift
//  Shopper
//
//  Created by Apple on 02/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import Foundation

struct CartItem {
    let itemTitle: String
    let itemAmount: Int
    let itemid: String
    let itemImage: String
    let itemQuantity: Int
    let itemCurrency: String
    
    // optional fields
    let itemCountry: String?
    let itemPackedDate: String?
    let itemExpiryDate: String?
    
    init?(dict:[String:Any]?) {
        guard let item = dict else { return nil }
        guard let title = item["itemTitle"] as? String else { return nil }
        guard let amount = item["itemAmount"] as? Int else { return nil }
        guard let id = item["itemid"] as? String else { return nil }
        guard let image = item["itemImage"] as? String else { return nil }
        guard let quantity = item["itemQuantity"] as? Int else { return nil }
        guard let currency = item["itemCurrency"] as? String else { return nil }
        
        itemTitle = title
        itemAmount = amount
        itemid = id
        itemImage = image
        itemQuantity = quantity
        itemCurrency = currency
        
        //optional fields
        itemCountry = item["itemCountry"] as? String
        itemPackedDate = item["itemPackedDate"] as? String
        itemExpiryDate = item["itemExpiryDate"] as? String
        
    }
}


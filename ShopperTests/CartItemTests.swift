//
//  CartItemTests.swift
//  ShopperTests
//
//  Created by Apple on 02/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import XCTest
@testable import Shopper
class CartItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Init_CartItemWithEmptyData() {
        let cartItemDict = [String:Any]()
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for an empty dict.")
        XCTAssertNil(CartItem(dict: nil), "CartItem init not failing for an nil dict.")
    }
    func test_Init_CartItemWithMandatoryData() {
        var cartItemDict = [String:Any]()
        cartItemDict["itemTitle"] = "Apple"
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemAmount"] = 70
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemid"] = "1"
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemImage"] = "apple.png"
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemQuantity"] = 2
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemCurrency"] = "INR"

        let item = CartItem(dict: cartItemDict)
        XCTAssertNotNil(item, "CartItem init failing for a valid dict.")
        
        //Equal asserts
        XCTAssertEqual(item?.itemTitle, "Apple", "Invalid name")
        XCTAssertEqual(item?.itemAmount, 70, "Invalid amount")
        XCTAssertEqual(item?.itemid, "1", "Invalid id")
        XCTAssertEqual(item?.itemImage, "apple.png", "Invalid image")
        XCTAssertEqual(item?.itemQuantity, 2, "Invalid image")
        XCTAssertEqual(item?.itemCurrency, "INR", "Invalid image")

    }
    func test_Init_CartItemWithCompleteData() {
        var cartItemDict = [String:Any]()
        cartItemDict["itemTitle"] = "Apple"
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemAmount"] = 70
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemid"] = "1"
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemImage"] = "apple.png"
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemQuantity"] = 2
        XCTAssertNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        cartItemDict["itemCurrency"] = "INR"
        XCTAssertNotNil(CartItem(dict: cartItemDict), "CartItem init not failing for partial dict.")
        
        // adding optional parameters
        cartItemDict["itemCountry"] = "IN"
        XCTAssertNotNil(CartItem(dict: cartItemDict), "CartItem init failing for optional parameters")
        cartItemDict["itemPackedDate"] = "7-5-2017"
        XCTAssertNotNil(CartItem(dict: cartItemDict), "CartItem init not failing for optional parameters")
        cartItemDict["itemExpiryDate"] = "7-6-2017"
        XCTAssertNotNil(CartItem(dict: cartItemDict), "CartItem init not failing for optional parameters")

        
        let item = CartItem(dict: cartItemDict)
        XCTAssertNotNil(item, "CartItem init  failing for a valid dict.")
        
        //Equal asserts
        XCTAssertEqual(item?.itemTitle, "Apple", "Invalid name")
        XCTAssertEqual(item?.itemAmount, 70, "Invalid amount")
        XCTAssertEqual(item?.itemid, "1", "Invalid id")
        XCTAssertEqual(item?.itemImage, "apple.png", "Invalid image")
        XCTAssertEqual(item?.itemQuantity, 2, "Invalid image")
        XCTAssertEqual(item?.itemCurrency, "INR", "Invalid image")
        
        XCTAssertEqual(item?.itemCountry, "IN", "Invalid image")
        XCTAssertEqual(item?.itemPackedDate, "7-5-2017", "Invalid image")
        XCTAssertEqual(item?.itemExpiryDate, "7-6-2017", "Invalid image")

    }
}

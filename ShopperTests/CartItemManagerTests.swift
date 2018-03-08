//
//  ItemManagerTests.swift
//  ShopperTests
//
//  Created by Apple on 02/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import XCTest
@testable import Shopper
class CartItemManagerTests: XCTestCase {
    var sut: CartItemsViewModel! // system under test
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = CartItemsViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_CartItemListAdded_Initially_IsZero() { // items in cart
        XCTAssertEqual(sut.cartItemsArray.count, 0)
    }
    func test_AddItem_ToCart_success() {
        var cartItemDict = [String:Any]()
        cartItemDict["itemTitle"] = "Apple"
        cartItemDict["itemAmount"] = 70
        cartItemDict["itemid"] = "1"
        cartItemDict["itemImage"] = "apple.png"
        cartItemDict["itemQuantity"] = 2
        cartItemDict["itemCurrency"] = "INR"
        cartItemDict["itemCountry"] = "IN"
        cartItemDict["itemPackedDate"] = "7-5-2017"
        let item = CartItem(dict: cartItemDict)
        XCTAssertNotNil(item)
        let itemListVMObj = ItemListViewModel(item: item!)
        XCTAssertNotNil(itemListVMObj)
        sut.add(itemListVMObj)
        XCTAssertEqual(sut.cartItemsArray.count, 1, "Number of items in cart is wrong")
    }
    func test_AddItem_ToCart_Failure() {
        sut.cartItemsArray.removeAll()
        sut.add(nil)
        XCTAssertEqual(sut.cartItemsArray.count, 0, "Number of items in cart is wrong")
    }
    func test_RemoveItem_FromCart_Success() {
        if sut.cartItemsArray.isEmpty {
        var cartItemDict = [String:Any]()
        cartItemDict["itemTitle"] = "Apple"
        cartItemDict["itemAmount"] = 70
        cartItemDict["itemid"] = "1"
        cartItemDict["itemImage"] = "apple.png"
        cartItemDict["itemQuantity"] = 2
        cartItemDict["itemCurrency"] = "INR"
        cartItemDict["itemCountry"] = "IN"
        cartItemDict["itemPackedDate"] = "7-5-2017"
        let item = CartItem(dict: cartItemDict)
        XCTAssertNotNil(item)
            let itemListVMObj = ItemListViewModel(item: item!)
            XCTAssertNotNil(itemListVMObj)
            sut.add(itemListVMObj)
            XCTAssertEqual(sut.cartItemsArray.count, 1, "Number of items in cart is wrong")
        }
        sut.remove(itemid:"1")
        XCTAssertEqual(sut.cartItemsArray.count, 0, "Number of items in cart is wrong")
    }
    func test_RemoveItem_FromCart_Failure() {
        if sut.cartItemsArray.isEmpty {
            var cartItemDict = [String:Any]()
            cartItemDict["itemTitle"] = "Apple"
            cartItemDict["itemAmount"] = 70
            cartItemDict["itemid"] = "1"
            cartItemDict["itemImage"] = "apple.png"
            cartItemDict["itemQuantity"] = 2
            cartItemDict["itemCurrency"] = "INR"
            cartItemDict["itemCountry"] = "IN"
            cartItemDict["itemPackedDate"] = "7-5-2017"
            let item = CartItem(dict: cartItemDict)
            XCTAssertNotNil(item)
            let itemListVMObj = ItemListViewModel(item: item!)
            XCTAssertNotNil(itemListVMObj)
            sut.add(itemListVMObj)
            XCTAssertEqual(sut.cartItemsArray.count, 1, "Number of items in cart is wrong")
        }
        sut.remove(itemid:"0")
        XCTAssertEqual(sut.cartItemsArray.count, 1, "Number of items in cart is wrong")
    }
    func test_RemoveItem_FromCart_Failure_EmptyArray() {
        sut.cartItemsArray.removeAll()
        sut.remove(itemid:"0")
        XCTAssertEqual(sut.cartItemsArray.count,0, "Number of items in cart is wrong")
    }
    
}

//
//  ListViewControllerTests.swift
//  ShopperTests
//
//  Created by Apple on 02/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import XCTest
@testable import Shopper

class ListViewControllerTests: XCTestCase {
    
    var sut: ListViewController!
    
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let viewController =
            storyboard.instantiateViewController(
                withIdentifier: "ListViewController")
        sut = viewController
            as! ListViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.listTableView)
    }
    func test_CartUIBarButton_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.cartButton)
    }
//    func test_CartItemList_Initially_IsZero() {  // total items available for purchase
//        let 
//        XCTAssertEqual(sut.cartItemsArray.count, 0)
//    }
    func test_CheckIfPlistExists() {
        let fileURL = Bundle.main.path(forResource: "ShoppingData", ofType: "plist")
        XCTAssertNotNil(fileURL, "ShoppingData.plist file does not exist")
    }
    
    func test_CheckIfPlistHasData() {
        var shoppingDataArray: [Any] = []
        if let fileURL = Bundle.main.path(forResource: "ShoppingData", ofType: "plist") {
            shoppingDataArray = (NSArray(contentsOfFile: fileURL) as? Array) ?? []
        }
        XCTAssertFalse(shoppingDataArray.isEmpty, "Should have shopping list items")
    }
    
}

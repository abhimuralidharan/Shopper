//
//  CartViewControllerTests.swift
//  ShopperTests
//
//  Created by Apple on 05/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import XCTest
@testable import Shopper
class CartViewControllerTests: XCTestCase {
    
    var sut: CartViewController!
    
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main",
                                      bundle: nil)
        let navVC =
            storyboard.instantiateViewController(
                withIdentifier: "cartVCnav") as! UINavigationController
        sut = navVC.viewControllers.first as! CartViewController
        sut.cartItemsViewModel = CartItemsViewModel()
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.cartTableView)
    }
}

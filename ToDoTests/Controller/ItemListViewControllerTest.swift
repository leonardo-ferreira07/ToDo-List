//
//  ItemListViewControllerTest.swift
//  ToDoTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 13/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemListViewControllerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        let sut = ItemListViewController()
        
        _ = sut.view
        
        XCTAssertNotNil(sut.tableView)
    }
    
}

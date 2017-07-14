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
    
    var sut: ItemListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as! ItemListViewController
        _ = sut.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableView_AfterViewDidLoad_IsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        XCTAssertTrue(sut.tableView?.dataSource is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView?.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableView?.dataSource as? ItemListDataProvider, sut.tableView?.delegate as? ItemListDataProvider)
    }
    
}
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
    
    func test_ItemListViewController_HasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        
        XCTAssertEqual(target as? UIViewController, sut)
    }
    
    func test_AddItem_PresentsAddItemViewController() {
        
        configSelector()
        
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is InputViewController)
        
        let inputViewController = sut.presentedViewController as! InputViewController
        XCTAssertNotNil(inputViewController.titleTextField)
        
    }
    
    func test_ItemListVC_SharesItemManagerWithInputVC() {
        
        configSelector()
        
        guard let inputViewController = sut.presentedViewController as? InputViewController else {
            XCTFail()
            return
        }
        guard let inputItemManager = inputViewController.itemManager else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(sut.itemManager === inputItemManager)
    }
    
    func configSelector() {
        guard let addButton = sut.navigationItem.rightBarButtonItem else {
            XCTFail()
            return
        }
        guard let action = addButton.action else {
            XCTFail()
            return
        }
        UIApplication.shared.keyWindow?.rootViewController = sut
        
        sut.performSelector(onMainThread: action, with: addButton, waitUntilDone: true)
    }
    
}

//
//  ToDoItemTests.swift
//  ToDoTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 10/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_Init_WhenGivenTitle_SetsTitle() {
        let item = ToDoItem(title: "Foo")
        XCTAssertNotNil(item.title, "Should set title")
    }

    func test_Init_WhenGivenDescription_SetsDescription() {
        let item = ToDoItem(title: "", itemDescription: "Bar")
        XCTAssertEqual(item.itemDescription, "Bar", "should set description")
    }

    func test_Init_WhenGivenTimestamp_SetsTimestamp() {
        let item = ToDoItem(title: "", timestamp: 0.0)
        XCTAssertEqual(item.timestamp, 0.0, "should set timestamp")
    }

    func test_Init_WhenGivenLocation_SetsLocation() {
        let location = Location(name: "Foo")
        let item = ToDoItem(title: "", location: location)
        XCTAssertEqual(item.location?.name, location.name, "should set location")
    }

    func test_EqualItems_AreEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Foo")

        XCTAssertEqual(first, second)
    }

    func test_Items_WhenLocationDiffers_AreNotLocal() {
        let first = ToDoItem(title: "", location: Location(name: "Foo"))
        let second = ToDoItem(title: "", location: Location(name: "Bar"))

        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenOneLocationIsNilAndTheOtherIsnt_AreNotEqual() {
        var first = ToDoItem(title: "", location: Location(name: "Foo"))
        var second = ToDoItem(title: "", location: nil)

        XCTAssertNotEqual(first, second)

        first = ToDoItem(title: "", location: nil)
        second = ToDoItem(title: "", location: Location(name: "Foo"))
        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenTimeStampsDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", timestamp: 1)
        let second = ToDoItem(title: "Foo", timestamp: 0)

        XCTAssertNotEqual(first, second)
    }

    func test_Items_WhenDescriptionsDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo", itemDescription: "Bar")
        let second = ToDoItem(title: "Foo", itemDescription: "Baz")

        XCTAssertNotEqual(first, second)
    }

    func test_ItemsWhenTitlesDiffer_AreNotEqual() {
        let first = ToDoItem(title: "Foo")
        let second = ToDoItem(title: "Bar")

        XCTAssertNotEqual(first, second)
    }

    func test_HasPlistDictionaryProperty() {
        let item = ToDoItem(title: "First")
        let dictionary = item.plistDict

        XCTAssertNotNil(dictionary)
        XCTAssertTrue(dictionary is [String: Any])
    }

    func test_CanBeCreatedFromPlistDictionary() {
        let location = Location(name: "Bar")
        let item = ToDoItem(title: "Foo", itemDescription: "Baz", timestamp: 1.0, location: location)

        let dict = item.plistDict
        let recreatedItem = ToDoItem(dict: dict)

        XCTAssertEqual(item, recreatedItem)
    }

}

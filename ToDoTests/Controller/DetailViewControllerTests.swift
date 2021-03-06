//
//  DetailViewControllerTests.swift
//  ToDoTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import XCTest
@testable import ToDo
import CoreLocation

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

        _ = sut.view

        sut.itemInfo?.0.removeAll()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()

        sut.itemInfo?.0.removeAll()
    }

    func test_HasTitleLabel() {

        XCTAssertNotNil(sut.titleLabel)
    }

    func test_HasDateLabel() {

        XCTAssertNotNil(sut.dateLabel)
    }

    func test_HasPlaceLabel() {

        XCTAssertNotNil(sut.placeLabel)
    }

    func test_HasDescriptionLabel() {

        XCTAssertNotNil(sut.descriptionLabel)
    }

    func test_HasMapView() {

        XCTAssertNotNil(sut.mapView)
    }

    func test_SettingItemInfo_SetsTextsToLabels() {
        let coordinate = CLLocationCoordinate2DMake(51.2277, 6.7735)

        let location = Location(name: "Foo", coordinate: coordinate)
        let item = ToDoItem(title: "Bar", itemDescription: "Baz", timestamp: 1456140025, location: location)

        var itemManager = ItemManager()
        itemManager.add(item)

        sut.itemInfo = (itemManager, 0)

        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()

        XCTAssertEqual(sut.titleLabel.text, "Bar")
        XCTAssertEqual(sut.dateLabel.text, "02/22/2016")
        XCTAssertEqual(sut.placeLabel.text, "Foo")
        XCTAssertEqual(sut.descriptionLabel.text, "Baz")
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, coordinate.latitude, accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, coordinate.longitude, accuracy: 0.001)
    }

    func test_CheckItem_ChecksItemInItemManager() {
        var itemManager = ItemManager()
        itemManager.add(ToDoItem(title: "Foo"))

        sut.itemInfo = (itemManager, 0)
        sut.checkItem()

        XCTAssertEqual(sut.itemInfo?.0.toDoCount, 0)
        XCTAssertEqual(sut.itemInfo?.0.doneCount, 1)
    }

}

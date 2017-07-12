//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 11/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ToDo

class LocationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_Init_WhenGivenCoordinate_SetsCoordinate() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
    }
    
    func test_Init_WhenGivenName_SetsName() {
        let location = Location(name: "Foo")
        XCTAssertEqual(location.name, "Foo")
    }
    
    func test_EqualLocations_AreEqual() {
        let first = Location(name: "Foo")
        let second = Location(name: "Foo")
        
        XCTAssertEqual(first, second)
    }
    
    func test_Locations_WhenLatitudeDiffers_AreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 1, longitude: 0)
        let first = Location(name: "Foo", coordinate: firstCoordinate)
        
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        
        XCTAssertNotEqual(first, second)
    }
    
    func test_Locations_WhenLongitudeDiffers_AreNotEqual() {
        let firstCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 1)
        let first = Location(name: "Foo", coordinate: firstCoordinate)
        
        let secondCoordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let second = Location(name: "Foo", coordinate: secondCoordinate)
        
        XCTAssertNotEqual(first, second)
    }
    
}

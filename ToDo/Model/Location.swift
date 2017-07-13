//
//  Location.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 11/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import Foundation
import CoreLocation

struct Location: Equatable {
    let name: String
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }
}

// MARK: - Equatable

extension Location {
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        if lhs.coordinate?.latitude != rhs.coordinate?.latitude {
            return false
        } else if lhs.coordinate?.longitude != rhs.coordinate?.longitude {
            return false
        } else if lhs.name != rhs.name {
            return false
        }
        return true
    }
    
}


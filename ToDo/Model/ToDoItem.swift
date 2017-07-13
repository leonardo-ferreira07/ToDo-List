//
//  ToDoItem.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 10/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import Foundation

struct ToDoItem: Equatable {
    
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String,
         itemDescription: String? = nil,
         timestamp: Double? = nil,
         location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
    
}

// MARK: - Equatable

extension ToDoItem {
    
    static func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
        if lhs.location != rhs.location {
            return false
        } else if lhs.timestamp != rhs.timestamp {
            return false
        } else if lhs.itemDescription != rhs.itemDescription {
            return false
        } else if lhs.title != rhs.title {
            return false
        }
        return true
    }
    
}

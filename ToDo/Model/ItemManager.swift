//
//  ItemManager.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 11/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import Foundation

struct ItemManager {
    var toDoCount: Int = 0
    let doneCount: Int = 0
    
    mutating func add(_ item: ToDoItem) {
        toDoCount += 1
    }
    
}

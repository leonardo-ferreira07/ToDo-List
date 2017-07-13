//
//  ItemManager.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 11/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import Foundation

struct ItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count }
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    mutating func add(_ item: ToDoItem) {
        if !toDoItems.contains(item) {
            toDoItems.append(item)
        }
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    mutating func checkItem(at index: Int) {
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    mutating func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
    
}

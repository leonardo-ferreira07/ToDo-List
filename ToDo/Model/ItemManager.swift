//
//  ItemManager.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 11/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import Foundation

class ItemManager: NSObject {
    
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count }
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    var toDoPathURL: URL {
        let fileUrls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let documentURL = fileUrls.first else {
            print("Something went wrong. Documents directory could not be found")
            fatalError()
        }
        
        return documentURL.appendingPathComponent("todoItems.plist")
    }
    
    var donePathURL: URL {
        let fileUrls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        guard let documentURL = fileUrls.first else {
            print("Something went wrong. Documents directory could not be found")
            fatalError()
        }
        
        return documentURL.appendingPathComponent("doneItems.plist")
    }
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(save), name: .UIApplicationWillResignActive, object: nil)
        
        if let nsToDoItems = NSArray(contentsOf: toDoPathURL) {
            for dict in nsToDoItems {
                if let toDoItem = ToDoItem(dict: dict as! [String: Any]) {
                    toDoItems.append(toDoItem)
                }
            }
        }
        
        if let doneToDoItems = NSArray(contentsOf: donePathURL) {
            for dict in doneToDoItems {
                if let toDoItem = ToDoItem(dict: dict as! [String: Any]) {
                    doneItems.append(toDoItem)
                }
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        save()
    }
    
    @objc func save() {
        let nsToDoItems = toDoItems.map { $0.plistDict }
        let nsDoneItems = doneItems.map { $0.plistDict }
        
        if nsToDoItems.isEmpty {
            try? FileManager.default.removeItem(at: toDoPathURL)
        }
        if nsDoneItems.isEmpty {
            try? FileManager.default.removeItem(at: donePathURL)
        }
        
        do {
            
            if nsToDoItems.isEmpty == false {
                let plistDataToDo = try PropertyListSerialization.data(
                    fromPropertyList: nsToDoItems,
                    format: PropertyListSerialization.PropertyListFormat.xml,
                    options: PropertyListSerialization.WriteOptions(0)
                )
                
                try plistDataToDo.write(to: toDoPathURL, options: Data.WritingOptions.atomic)
            }
            
            if nsDoneItems.isEmpty == false {
                let plistDataDone = try PropertyListSerialization.data(
                    fromPropertyList: nsDoneItems,
                    format: PropertyListSerialization.PropertyListFormat.xml,
                    options: PropertyListSerialization.WriteOptions(0)
                )
                
                try plistDataDone.write(to: donePathURL, options: Data.WritingOptions.atomic)
            }
            
        } catch {
            print(error)
        }
    }
    
    func add(_ item: ToDoItem) {
        if !toDoItems.contains(item) {
            toDoItems.append(item)
        }
    }
    
    func item(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    
    func checkItem(at index: Int) {
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    
    func uncheckItem(at index: Int) {
        let item = doneItems.remove(at: index)
        toDoItems.append(item)
    }
    
    func doneItem(at index: Int) -> ToDoItem {
        return doneItems[index]
    }
    
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
    
}

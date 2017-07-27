//
//  InputViewController.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 21/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import UIKit
import CoreLocation

class InputViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var dayTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    lazy var geocoder = CLGeocoder()
    var itemManager: ItemManager?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    @IBAction func save() {
        guard let titleString = titleTextField.text, titleString.characters.count > 0 else { return }
        
        let date: Date?
        if let dateText = self.dayTextField.text, dateText.characters.count > 0 {
            date = dateFormatter.date(from: dateText)
        } else {
            date = nil
        }
        
        let descriptionString = descriptionTextField.text
        if let locationName = locationTextField.text, locationName.characters.count > 0 {
            if let address = addressTextField.text, address.characters.count > 0 {
                
                geocoder.geocodeAddressString(address, completionHandler: { (placeMarks, error) in
                    let placeMark = placeMarks?.first
                    
                    let item = ToDoItem(title: titleString, itemDescription: descriptionString, timestamp: date?.timeIntervalSince1970, location: Location(name: locationName, coordinate: placeMark?.location?.coordinate))
                    
                    self.itemManager?.add(item)
                    
                })
                
            }
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}

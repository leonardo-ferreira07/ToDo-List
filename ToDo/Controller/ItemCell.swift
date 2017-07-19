//
//  ItemCell.swift
//  ToDo
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 17/07/17.
//  Copyright © 2017 iOS Wizards. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(with item: ToDoItem, checked: Bool = false) {
        
        if checked {
            let attributedString = NSAttributedString(string: item.title, attributes: [NSAttributedStringKey.strikethroughStyle: NSUnderlineStyle.styleSingle.rawValue])
            
            titleLabel.attributedText = attributedString
            locationLabel.text = nil
            dateLabel.text = nil
        } else {
        
            titleLabel.text = item.title
            locationLabel.text = item.location?.name
            
            if let timestamp = item.timestamp {
                
                let date = Date(timeIntervalSince1970: timestamp)
                dateLabel.text = dateFormatter.string(from: date)
                
            }
        }
    }

}

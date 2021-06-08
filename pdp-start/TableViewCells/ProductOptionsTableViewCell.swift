//
//  ProductOptionsTableViewCell.swift
//  pdp-start
//
//  Created by Dylan Vera on 6/7/21.
//  Copyright © 2021 Tapcart. All rights reserved.
//

import UIKit
import DropDown

class ProductOptionsTableViewCell: UITableViewCell {
    static let identifier = "ProductOptionsCell"

    var options: [ProductOption]!
    var optionPickers = [UIPickerView]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureOptions() {
        for option in options {
            print(option)
        }
    }
}

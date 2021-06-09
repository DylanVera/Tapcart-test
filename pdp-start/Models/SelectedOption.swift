//
//  SelectedOption.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import Foundation

class SelectedOption: Codable {
    /// Will be something like "size" or "color"
    var name: String
    
    /// Will be something like "m" or "red"
    var value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

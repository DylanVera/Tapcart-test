//
//  ProductOption.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import Foundation

class ProductOption: Codable {
    var id: String
    
    /// Will be something like "size" or "color"
    var name: String
    
    /// Will be something like ["red", blue"] or ["sm", "m", "l"]
    var values: [String]
}

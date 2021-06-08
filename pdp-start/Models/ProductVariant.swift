//
//  ProductVariant.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import Foundation

class ProductVariant: Codable {
    var id: String
    var image: String
    
    /// Will have up to 3 options
    var selectedOptions: [SelectedOption]
}

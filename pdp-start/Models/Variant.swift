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
    var selectedOptions: [SelectedOption]
}

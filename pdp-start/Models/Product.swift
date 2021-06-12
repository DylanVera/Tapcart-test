//
//  Product.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import Foundation

class Product: Codable {
    var id: String
    var title: String
    var price: Double
    
    /// Will have up to 3 options
    var options: [ProductOption]
    
    /// The different type of product options possible
    var variants: [ProductVariant]
}

extension Product {
    func findVariant(with options: [SelectedOption]) -> ProductVariant? {
        for variant in variants {
            if variant.selectedOptions.elementsEqual(options) {
                return variant
            }
        }
        
        return nil
    }
}

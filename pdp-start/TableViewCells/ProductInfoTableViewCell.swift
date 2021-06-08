//
//  ProductInfoTableViewCell.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import UIKit

class ProductInfoTableViewCell: UITableViewCell {

    /// Amount of products in the Shopping Cart
    @IBOutlet weak var shoppingCartCountLabel: UILabel!
    
    /// Image of the selected variant option
    @IBOutlet weak var productImageView: UIImageView!
    
    /// Title of the product
    @IBOutlet weak var productTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

//
//  AddToCartTableViewCell.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import UIKit

protocol AddToCartDelegate: AnyObject {
    func addToCart(_ sender: UIButton)
}

class AddToCartTableViewCell: UITableViewCell {

    weak var delegate: AddToCartDelegate?
    @IBOutlet weak var addToCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func didTapButton(sender: UIButton) {
        delegate?.addToCart(self.addToCartButton)
    }
}

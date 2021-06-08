//
//  DetailViewController.swift
//  pdp-start
//
//  Created by Dylan Vera on 6/7/21.
//  Copyright © 2021 Tapcart. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var product: Product?
    var productImageView = UIImageView()
    var productTitle = UILabel()
    var addToCartButton = UIButton()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

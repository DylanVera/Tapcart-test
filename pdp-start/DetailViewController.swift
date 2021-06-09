//
//  DetailViewController.swift
//  pdp-start
//
//  Created by Dylan Vera on 6/7/21.
//  Copyright © 2021 Tapcart. All rights reserved.
//

import UIKit
import SDWebImage
import DropDown

class DetailViewController: UIViewController {
    
    var product: Product!
    var productImageView = UIImageView()
    var productTitle = UILabel()
    var addToCartButton = UIButton()
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        // Do any additional setup after loading the view.
    }
    
    func setupSubViews() {
        view.backgroundColor = .white
        view.addSubview(productImageView)
        view.addSubview(productTitle)
        view.addSubview(addToCartButton)
        productTitle.numberOfLines = 0
        productTitle.adjustsFontSizeToFitWidth = true
        productTitle.font = .systemFont(ofSize: 18, weight: .bold)
        productTitle.text = product.title
        productTitle.translatesAutoresizingMaskIntoConstraints = false
        productTitle.leadingAnchor.constraint(equalTo: productTitle.trailingAnchor, constant: 10).isActive = true
        productTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        productTitle.preferredMaxLayoutWidth = 180
        
        dropDown.anchorView = view
    }
}

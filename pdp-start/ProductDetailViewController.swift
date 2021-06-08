//
//  ProductDetailViewController.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddToCartDelegate {
    var product: Product?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ProductInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductInfoCell")
        tableView.register(ProductOptionsTableViewCell.self, forCellReuseIdentifier: "ProductOptionsCell")
        tableView.register(UINib(nibName: "AddToCartTableViewCell", bundle: nil), forCellReuseIdentifier: "AddToCartCell")
//        productTitle.text = product?.title
        // Do any additional setup after loading the view.
    }
    
    func configure(with product: Product) {
        self.product = product
    }
    
    func addToCart(_ sender: UIButton) {
        print("add to cart")
    }
}

extension ProductDetailViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoCell") as! ProductInfoTableViewCell
            cell.productTitleLabel.text = product?.title
            cell.productImageView.sd_setImage(with: URL(string: product?.variants[0].image ?? ""), completed: nil)
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductOptionsCell") as! ProductOptionsTableViewCell
            //set the data here
            cell.options = product?.options
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddToCartCell") as! AddToCartTableViewCell
            cell.delegate = self
            return cell
        }
    }
}

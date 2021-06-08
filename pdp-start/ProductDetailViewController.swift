//
//  ProductDetailViewController.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import UIKit
import SDWebImage

class ProductDetailViewController: UITableViewController, AddToCartDelegate  {
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "ProductInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductInfoCell")
//        tableView.register(UINib(nibName: "ProductOptionsTableCellView", bundle: nil), forCellReuseIdentifier: "ProductOptionsCell")
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension ProductDetailViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoCell") as! ProductInfoTableViewCell
            cell.productTitleLabel.text = product?.title
            cell.productImageView.sd_setImage(with: URL(string: product?.variants[0].image ?? ""), completed: nil)
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductOptionsCell") as! ProductOptionsTableViewCell
            //set the data here
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddToCartCell") as! AddToCartTableViewCell
            cell.delegate = self
            return cell
        }
    }
}

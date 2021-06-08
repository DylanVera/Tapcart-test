//
//  ProductListTableViewController.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import UIKit

class ProductListTableViewController: UITableViewController {
    
    private let resuseIdentifier = "ProductListTableViewCell"
    
    var products = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Products"
        products = ProductService.shared.getProducts() ?? []
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowProductDetailSegue", let destination = segue.destination as? ProductDetailViewController,
           let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let product = products[indexPath.row]
            destination.configure(with: product)
        }
    }
}

// MARK: - Table view data source

extension ProductListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resuseIdentifier, for: indexPath)
        cell.textLabel?.text = products[indexPath.row].title
        return cell
    }
}

// MARK: - Table view delegate

extension ProductListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.product = product
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//
//  ProductDetailViewController.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import UIKit
import SDWebImage
import DropDown

class ProductDetailViewController: UIViewController {
    
    var product: Product?
    var selectedOptions = [SelectedOption]()
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var firstOptionButton: UIButton!
    @IBOutlet weak var secondOptionButton: UIButton!
    @IBOutlet weak var thirdOptionButton: UIButton!
    
    //MARK: - DropDown's
    let firstOptionDropDown = DropDown()
    let secondOptionDropDown = DropDown()
    let thirdOptionDropDown = DropDown()
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.firstOptionDropDown,
            self.secondOptionDropDown,
            self.thirdOptionDropDown,
        ]
    }()
    
    // DropDown Actions
    @IBAction func chooseFirstOption(_ sender: AnyObject) {
        firstOptionDropDown.show()
    }
    
    @IBAction func chooseSecondOption(_ sender: AnyObject) {
        secondOptionDropDown.show()
    }
    
    @IBAction func chooseThirdOption(_ sender: AnyObject) {
        thirdOptionDropDown.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTitle.text = product?.title
        productImage.sd_setImage(with: URL(string: product?.variants[0].image ?? ""), completed: nil)
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        
        if product?.options.count == 3 {
            thirdOptionButton.isHidden = false
        }
        
        setupDropDowns()
    }
    
    func configure(with product: Product) {
        self.product = product
    }
    
    func setupDropDowns() {
        firstOptionDropDown.anchorView = firstOptionButton
        firstOptionDropDown.bottomOffset = CGPoint(x: 0, y: firstOptionButton.bounds.height)
        
        firstOptionDropDown.dataSource = (product?.options[0].values)!
        selectedOptions.append(SelectedOption(name: (product?.options[0].name)!, value: firstOptionDropDown.dataSource[0]))
        firstOptionButton.setTitle(firstOptionDropDown.dataSource[0], for: .normal)
        // Action triggered on selection
        firstOptionDropDown.selectionAction = { [weak self] (index, item) in
            self?.firstOptionButton.setTitle(item, for: .normal)
            self?.selectedOptions[0].value = item
            
            //find matching variant and load image if necessary
           DispatchQueue.main.async {
            
            self?.productImage.sd_setImage(with: URL(string: self?.product?.variants[(self?.product?.variants.count)! - 1].image ?? ""), completed: nil)
            self?.productImage.setNeedsDisplay()
           }
            
        }
        
        secondOptionDropDown.anchorView = secondOptionButton
        secondOptionDropDown.bottomOffset = CGPoint(x: 0, y: secondOptionButton.bounds.height)
        
        secondOptionDropDown.dataSource = (product?.options[1].values)!
        selectedOptions.append(SelectedOption(name: (product?.options[1].name)!, value: secondOptionDropDown.dataSource[0]))
        secondOptionButton.setTitle(secondOptionDropDown.dataSource[0], for: .normal)
        // Action triggered on selection
        secondOptionDropDown.selectionAction = { [weak self] (index, item) in
            self?.secondOptionButton.setTitle(item, for: .normal)
            self?.selectedOptions[1].value = item
        }
        
        if product?.options.count == 3{
            thirdOptionDropDown.anchorView = thirdOptionButton
            thirdOptionDropDown.bottomOffset = CGPoint(x: 0, y: thirdOptionButton.bounds.height)

            thirdOptionDropDown.dataSource = (product?.options[2].values)!
            selectedOptions.append(SelectedOption(name: (product?.options[2].name)!, value: thirdOptionDropDown.dataSource[0]))
            thirdOptionButton.setTitle(thirdOptionDropDown.dataSource[0], for: .normal)
            // Action triggered on selection
            thirdOptionDropDown.selectionAction = { [weak self] (index, item) in
                self?.thirdOptionButton.setTitle(item, for: .normal)
                self?.selectedOptions[2].value = item
            }
        }
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        var variantString = ""
        for option in selectedOptions {
            variantString += option.value + " "
        }
        print(variantString)
    }
}

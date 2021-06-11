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
    var selectedVariant: ProductVariant? {
        didSet{
            updateProductPhoto()
        }
    }
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    
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
    @IBAction func chooseOptionDropDown(_ sender: AnyObject) {
        dropDowns[sender.tag].show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productTitle.text = product?.title
        productImage.sd_setImage(with: URL(string: product?.variants[0].image ?? ""), completed: nil)
        dropDowns.forEach { $0.dismissMode = .onTap }
        dropDowns.forEach { $0.direction = .any }
        
        if product?.options.count == 3 {
            optionButtons[2].isHidden = false
        }
        
        setupDropDowns()
        selectedVariant = findVariant()
    }
    
    func configure(with product: Product) {
        self.product = product
    }
    
    func updateProductPhoto() {
        if let variant = selectedVariant {
            DispatchQueue.main.async {
                self.productImage.sd_setImage(with: URL(string: variant.image), completed: nil)
                self.productImage.setNeedsDisplay()
            }
        }
    }
    
    func findVariant() -> ProductVariant? {
        if let variants = product?.variants {
            for variant in variants {
                if variant.selectedOptions.elementsEqual(selectedOptions) {
                    return variant
                }
            }
        }
        
        return nil
    }
    
    func setupDropDowns() {
        if let options = product?.options {
            for i in 0..<options.count {
                dropDowns[i].anchorView = optionButtons[i]
                dropDowns[i].bottomOffset = CGPoint(x: 0, y: optionButtons[i].bounds.height)
                dropDowns[i].dataSource = options[i].values
                optionButtons[i].setTitle(dropDowns[i].dataSource[0], for: .normal)
                selectedOptions.append(SelectedOption(name: options[i].name, value: dropDowns[i].dataSource[0]))
                
                
                dropDowns[i].selectionAction = { [weak self] (index, item) in
                    self?.optionButtons[i].setTitle(item, for: .normal)
                    self?.selectedOptions[i].value = item
                    self?.selectedVariant = self?.findVariant()
                }
            }
        }
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        print(selectedVariant!)
    }
}

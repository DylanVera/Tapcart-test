//
//  interview_iosTests.swift
//  interview-iosTests
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import XCTest
@testable import pdp_start

class interview_iosTests: XCTestCase {

    var products: [Product]?
    var product: Product?
    
    override func setUpWithError() throws {
        //Fails to build because I don't think you can access the main bundle from unit tests
        //If I had more time I would design the viewcontroller and models to be more easily testable
        super.setUp()
        products = ProductService.shared.getProducts()
        product = products?[0]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        products = nil
        product = nil
        super.tearDown()
    }
    
    func testFindVariant() throws {
        let variant = product?.findVariant(with: (product?.variants[0].selectedOptions)!)
        let unwrappedVal = try XCTUnwrap(variant)
        XCTAssert(unwrappedVal.selectedOptions == product?.variants[0].selectedOptions)
    }
    
    func testSelectedOptionEquatable() {
        let testOptions = SelectedOption(name: "size", value: "sm")
        XCTAssertTrue(product?.variants[0].selectedOptions[0] == testOptions)
    }
    
    func testProductVariantPrintOutput() {
        let test = product?.variants[0].description
        XCTAssertTrue(test == "sm red")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

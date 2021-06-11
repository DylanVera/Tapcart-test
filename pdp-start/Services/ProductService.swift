//
//  ProductService.swift
//  interview-ios
//
//  Created by Aaron Orozco on 5/5/20.
//  Copyright © 2020 Tapcart. All rights reserved.
//

import Foundation

class ProductService {
    
    static let shared = ProductService()
    
    struct ProductsResult: Codable {
        var products: [Product]
    }
    
    private func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        }
        catch {
            print("error: \(error)")
        }
        
        return nil
    }
    
    func getProducts() -> [Product]? {
        let jsonData = readLocalJSONFile(forName: "products")
        
        if let data = jsonData {
            do {
                let decodedData = try JSONDecoder().decode(ProductsResult.self, from: data)
                return decodedData.products
            }
            catch {
                print("error: \(error)")
            }
        }
        
        return nil
    }
}

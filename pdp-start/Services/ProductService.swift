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
            guard
                let path = Bundle.main.path(forResource: "products", ofType: "json")
                else { fatalError("Can't find json file") }
            
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl)
                return data
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

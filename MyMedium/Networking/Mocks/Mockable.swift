//
//  Mockable.swift
//  MyMedium
//
//  Created by Victor Santos on 29/07/24.
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    
    func loadJSON<T: Decodable>(file: String) -> T
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(file: String) -> T {
        guard let path = bundle.url(forResource: file, withExtension: ".json") else {
            fatalError("Failed to load the JSON file")
        }
        
        do {
            print("entrei")
            let data = try Data(contentsOf: path)
            let decoded = try JSONDecoder().decode(T.self, from: data)
            
            return decoded
        } catch {
            fatalError("Failed to decode the JSON file")
        }
    }
}

//
//  Dictonary + Extension.swift
//  PetsUI
//
//  Created by Saavaj Studios on 01/01/24.
//

import Foundation

extension Dictionary{
    
    func decode<T: Decodable>() -> T?{
    
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else{
            return nil
        }
        
        return try? JSONDecoder().decode(T.self, from: data)
        
    }
}

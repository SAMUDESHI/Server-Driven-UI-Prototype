//
//  WebService.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation

enum NetworkError : Error{
    case notFound
    case invalidUrl
    case invalidResponse
}

class WebService{
    
    func load(resource: String) async throws -> ScreenModel{
        
        guard let url = URL(string: resource) else{
            throw NetworkError.invalidUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else{
            NetworkError.invalidResponse
        }
        
       return try JSONDecoder().decode(ScreenModel.self,from: data)
        
        
    }
}

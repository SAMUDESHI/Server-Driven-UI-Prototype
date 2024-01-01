//
//  ScreenModel.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation

enum ComponentError: Error{
    case decodingError
}

enum ComponentType: String , Decodable{
    case featuredImage
}


struct ComponentModel : Decodable{
    let type : ComponentType
    let data: [String:String]
}

struct ScreenModel : Decodable{
    let pageTitle : String
    let components : [ComponentModel]
}

extension ScreenModel{
    
    func buildComponents() throws -> [UIComponents]{
        
        var components: [UIComponents] = []

        for compoment in self.components {
            switch compoment.type{
                
            case .featuredImage:
                guard let uiModel: FeaturedImageUIModel = compoment.data.decode() else{
                    throw ComponentError.decodingError
                }
                components.append(FeaturedImageComponent(uiModel: uiModel))
            }
        }
        return components
    }
}

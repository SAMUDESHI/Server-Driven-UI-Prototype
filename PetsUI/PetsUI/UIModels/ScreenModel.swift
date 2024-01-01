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
    case carousel
}


struct ComponentModel : Decodable{
    let type : ComponentType
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey{
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
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
            case .carousel:
                guard let uiModel: CarouselUIModel = compoment.data.decode() else{
                    throw ComponentError.decodingError
                }
                components.append(CarouselComponent(uiModel: uiModel))
            }
        }
        return components
    }
}

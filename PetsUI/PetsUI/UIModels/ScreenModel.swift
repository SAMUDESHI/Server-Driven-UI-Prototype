//
//  ScreenModel.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation

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
                print("Fine Till here")
            }
        }
    }
}

//
//  FeaturedImageComponents.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponents{
    
    let uiModel  : FeaturedImageUIModel
    
    var uniqueID: String{
        return ComponentType.featuredImage.rawValue
    }
    func render() -> AnyView {
        
        AsyncImage(url: uiModel.imageUrl) { image in
          image.resizable()
                .aspectRatio(contentMode: .fill)
        }placeholder: {
            ProgressView()
        }.toAnyView()
        
    }
}

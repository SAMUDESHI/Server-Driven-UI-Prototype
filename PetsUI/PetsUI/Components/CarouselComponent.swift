//
//  CarouselComponent.swift
//  PetsUI
//
//  Created by Saavaj Studios on 01/01/24.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponents{
    
    let uiModel  : CarouselUIModel
    
    var uniqueID: String{
        return ComponentType.carousel.rawValue
    }
    func render() -> AnyView {
        
        CarouselView(uiModel: uiModel).toAnyView()
        
    }
}

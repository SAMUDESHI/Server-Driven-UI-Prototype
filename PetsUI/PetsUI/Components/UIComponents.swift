//
//  UIComponents.swift
//  PetsUI
//
//  Created by Mishal_Office_Mac on 30/12/23.
//

import Foundation
import SwiftUI

protocol UIComponents{
    var uniqueID: String {get}
    func render()-> AnyView
}

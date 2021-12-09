//
//  Category.swift
//  EcoShopper
//
//  Created by robert on 2021-11-18.
//

import Foundation
import SwiftUI

class Category: Identifiable, ObservableObject{
    @Published var nameId: String = ""
    @Published var imageName: String = ""
    
    init(name: String, imageName: String){
        nameId = name
        self.imageName = imageName
    }
}

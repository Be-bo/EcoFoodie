//
//  Allergy.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-15.
//

import Foundation
import SwiftUI

class Allergy: Identifiable, ObservableObject{
    @Published var nameId: String = ""
    @Published var imageName: String = ""
    
    init(name: String, imageName: String){
        nameId = name
        self.imageName = imageName
    }
}

//
//  Ingredient.swift
//  EcoShopper
//
//  Created by robert on 2021-11-01.
//

import Foundation
import SwiftUI

class Ingredient: Identifiable, ObservableObject{
    @Published var nameId: String = ""
    @Published var imageName: String = ""
    @Published var quantity: CGFloat = 1 //default quantity of the given units below
    @Published var units: String = ""
    @Published var amount: Int = 1 //multiplier for the the default quantity
    @Published var dateBought: Date
    @Published var bestBeforeDate: Date
    @Published var category: String = ""
    
    
    init(name: String, imageName: String, category: String){
        nameId = name
        self.imageName = imageName
        self.category = category
        dateBought = Date.now
        bestBeforeDate = Date.now
        bestBeforeDate = dateBought.addingTimeInterval(1209600)
    }
    
    
    /// Sets default quantity and units for this ingredient.
    /// - Parameters:
    ///   - quantity: default quantity number for the given units
    ///   - units: default units for the ingredient (always go together with its quantity)
    func setQuantity(quantity: CGFloat, units: String){
        self.quantity = quantity
        self.units = units
    }
}

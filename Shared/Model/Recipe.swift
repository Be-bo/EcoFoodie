//
//  Recipe.swift
//  EcoShopper
//
//  Created by robert on 2021-11-01.
//

import Foundation
import SwiftUI

class Recipe: Identifiable, ObservableObject{
    @Published var nameId: String = ""
    @Published var imageName: String = ""
    @Published var ingredients = [Ingredient]()
    @Published var keywords = [String]()
    @Published var timeToCook: String = ""
    @Published var instructions = [String]()
    @Published var portionNumber: Int = 1
    @Published var ingredientsAdded: Bool = false //ingredients added to cart for this recipe instance
    @Published var ingredientString: String = "" //comma-separated list of all ingredient names for this recipe
    @Published var planStatus: String = "Ingredients Missing"
    
    init(name: String, imageName: String, ingredients: [Ingredient], timeToCook: String, instructions: [String]){
        nameId = name
        self.imageName = imageName
        self.timeToCook = timeToCook
        self.ingredients = ingredients
        self.instructions = instructions
        for ingredient in ingredients {
            ingredientString = ingredientString + ", " + ingredient.nameId
        }
    }
}

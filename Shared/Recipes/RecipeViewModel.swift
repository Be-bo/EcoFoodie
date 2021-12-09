//
//  RecipeViewModel.swift
//  EcoShopper
//
//  Created by robert on 2021-11-02.
//

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject{
    @Published var useUpRecipes = [Recipe]()
    @Published var quickDishRecipes = [Recipe]()
    @Published var meatRecipes = [Recipe]()
    var statDat: StaticData = StaticData()
    
    init(){
        
        for i in 0..<5{
            quickDishRecipes.append(statDat.AllRecipes[i])
        }
        
        for i in 5..<10{
            meatRecipes.append(statDat.AllRecipes[i])
        }
        
        
        
        /*
        // MARK: Use Up Array
        useUpRecipes = [
            Recipe(name: "Thai Red Curry Chicken", imageName: "ThaiRed", ingredients:
                   [Ingredient(name: "Coconut Oil", imageName: ""),
                    Ingredient(name: "Chicken Breast", imageName: ""),
                    Ingredient(name: "Coconut Cream", imageName: ""),
                    Ingredient(name: "Red Thai Sauce", imageName: ""),
                    Ingredient(name: "Rice Noodles", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Skillet Chicken Bulgogi", imageName: "SkilletChicken", ingredients:
                   [Ingredient(name: "Onion", imageName: ""),
                    Ingredient(name: "Garlic", imageName: ""),
                    Ingredient(name: "Chicken Breast", imageName: ""),
                    Ingredient(name: "Soy Sauce", imageName: ""),
                    Ingredient(name: "Sesame Oil", imageName: ""),
                    Ingredient(name: "White Rice", imageName: ""),
                    Ingredient(name: "Ground Black Pepper", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Chicken Pasta Artichoke", imageName: "ChickenPasta", ingredients:
                   [Ingredient(name: "Penne Pasta", imageName: ""),
                    Ingredient(name: "Marinated Artichokes", imageName: ""),
                    Ingredient(name: "Chicken Breast", imageName: ""),
                    Ingredient(name: "Fresh Mushrooms", imageName: ""),
                    Ingredient(name: "Chicken Broth", imageName: ""),
                    Ingredient(name: "White Wine", imageName: ""),
                    Ingredient(name: "Cornstarch", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Chorizo Street Tacos", imageName: "ChorizoStreet", ingredients:
                   [Ingredient(name: "Chorizo Sausage", imageName: ""),
                    Ingredient(name: "Chipotle Peppers", imageName: ""),
                    Ingredient(name: "Adobo Sauce", imageName: ""),
                    Ingredient(name: "Corn Tortillas", imageName: ""),
                    Ingredient(name: "Onion", imageName: ""),
                    Ingredient(name: "Cilantro", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Mushroom Spinach Omelette", imageName: "MushroomSpinach", ingredients:
                   [Ingredient(name: "Eggs", imageName: ""),
                    Ingredient(name: "Cheddar Cheese", imageName: ""),
                    Ingredient(name: "Parmesan Cheese", imageName: ""),
                    Ingredient(name: "Chopped Onion", imageName: ""),
                    Ingredient(name: "Fresh Mushrooms", imageName: ""),
                    Ingredient(name: "Fresh Spinach", imageName: ""),
                    Ingredient(name: "Olive Oil", imageName: "")
                   ], timeToCook: "30min", instructions: [String]())
        ]
        
        
        
        
        // MARK: Save for Later Array
        saveLaterRecipes = [
            Recipe(name: "Vegan Overnight Oats", imageName: "VeganOvernight", ingredients:
                   [Ingredient(name: "Almond Milk", imageName: ""),
                    Ingredient(name: "Ripe Banana", imageName: ""),
                    Ingredient(name: "Rolled Oats", imageName: ""),
                    Ingredient(name: "Chia Seeds", imageName: ""),
                    Ingredient(name: "Grond Cinnamon", imageName: ""),
                    Ingredient(name: "Blueberries", imageName: ""),
                    Ingredient(name: "Blackberries", imageName: ""),
                    Ingredient(name: "Nectarine", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Bacon and Egg Tacos", imageName: "BaconAnd", ingredients:
                   [Ingredient(name: "Eggs", imageName: ""),
                    Ingredient(name: "Bacon", imageName: ""),
                    Ingredient(name: "Butter", imageName: ""),
                    Ingredient(name: "Flour Tortillas", imageName: ""),
                    Ingredient(name: "Cheddar Cheese", imageName: ""),
                    Ingredient(name: "Salsa", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Thai Rice & Noodle Salad", imageName: "ThaiRice", ingredients:
                   [Ingredient(name: "Rice Noodles", imageName: ""),
                    Ingredient(name: "Red Onion", imageName: ""),
                    Ingredient(name: "Romaine Lettuce", imageName: ""),
                    Ingredient(name: "Bell Pepper", imageName: ""),
                    Ingredient(name: "Green Onions", imageName: ""),
                    Ingredient(name: "Cucumber", imageName: ""),
                    Ingredient(name: "Fresh Basil", imageName: ""),
                    Ingredient(name: "Cilantro", imageName: ""),
                    Ingredient(name: "Jalapeno Preppers", imageName: ""),
                    Ingredient(name: "Garlic", imageName: ""),
                    Ingredient(name: "Ginger", imageName: ""),
                    Ingredient(name: "Olive Oil", imageName: ""),
                    Ingredient(name: "Soy Sauce", imageName: ""),
                    Ingredient(name: "Lemon", imageName: ""),
                    Ingredient(name: "Paprika", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Guacamole", imageName: "Guacamole", ingredients:
                   [Ingredient(name: "Avocados", imageName: ""),
                    Ingredient(name: "Lime", imageName: ""),
                    Ingredient(name: "Onion", imageName: ""),
                    Ingredient(name: "Cilantro", imageName: ""),
                    Ingredient(name: "Garlic", imageName: ""),
                    Ingredient(name: "Roma Tomato", imageName: ""),
                    Ingredient(name: "Cayenne Pepper", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Chana Masala", imageName: "ChanaMasala", ingredients:
                   [Ingredient(name: "Chickpeas", imageName: ""),
                    Ingredient(name: "Onion", imageName: ""),
                    Ingredient(name: "Tomatoes", imageName: ""),
                    Ingredient(name: "Ginger", imageName: ""),
                    Ingredient(name: "Garlic", imageName: ""),
                    Ingredient(name: "Olive Oil", imageName: ""),
                    Ingredient(name: "Bay Leaves", imageName: ""),
                    Ingredient(name: "Cilantro", imageName: ""),
                    Ingredient(name: "Chilli Powder", imageName: ""),
                    Ingredient(name: "Coriander", imageName: ""),
                    Ingredient(name: "Garam Masala", imageName: "")
                   ], timeToCook: "30min", instructions: [String]())
        ]
        
        
        
        
        
        // MARK: Favorites Array
        favoriteRecipes = [
            Recipe(name: "Lemon Dill Salmon", imageName: "LemonDill", ingredients:
                   [Ingredient(name: "Butter", imageName: ""),
                    Ingredient(name: "White Wine", imageName: ""),
                    Ingredient(name: "Lemon", imageName: ""),
                    Ingredient(name: "Garlic", imageName: ""),
                    Ingredient(name: "Dill", imageName: ""),
                    Ingredient(name: "Salmon Fillet", imageName: ""),
                    Ingredient(name: "Almonds", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Panko Parmesan Salmon", imageName: "PankoParmesan", ingredients:
                   [Ingredient(name: "Salmon Fillet", imageName: ""),
                    Ingredient(name: "Lime", imageName: ""),
                    Ingredient(name: "Panko Bread Crumb", imageName: ""),
                    Ingredient(name: "Parmesan Grated", imageName: ""),
                    Ingredient(name: "Olive Oil", imageName: ""),
                    Ingredient(name: "Italian Seasonsing", imageName: ""),
                    Ingredient(name: "Garlic Powder", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Vegan Stir Fry Noodle", imageName: "VeganStir", ingredients:
                   [Ingredient(name: "Soba Noodles", imageName: ""),
                    Ingredient(name: "Onion", imageName: ""),
                    Ingredient(name: "Garlic", imageName: ""),
                    Ingredient(name: "Mushrooms", imageName: ""),
                    Ingredient(name: "Eggplant", imageName: ""),
                    Ingredient(name: "Bok Choy Leaves", imageName: ""),
                    Ingredient(name: "Soy Sauce", imageName: ""),
                    Ingredient(name: "Teriyaki Sauce", imageName: ""),
                    Ingredient(name: "Sesame Oil", imageName: ""),
                    Ingredient(name: "Green Onion", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Indian Kale and Moong Dal", imageName: "IndianKale", ingredients:
                   [Ingredient(name: "Moong Dal", imageName: ""),
                    Ingredient(name: "Olive Oil", imageName: ""),
                    Ingredient(name: "Kale", imageName: ""),
                    Ingredient(name: "Ground Turmeric", imageName: ""),
                    Ingredient(name: "Cumin Seeds", imageName: ""),
                    Ingredient(name: "Chilli", imageName: "")
                   ], timeToCook: "30min", instructions: [String]()),
            
            Recipe(name: "Apple Curry Turkey Pita", imageName: "", ingredients:
                   [Ingredient(name: "Olive Oil", imageName: ""),
                    Ingredient(name: "Onion", imageName: ""),
                    Ingredient(name: "Lemon", imageName: ""),
                    Ingredient(name: "Turkey", imageName: ""),
                    Ingredient(name: "Pita Bread", imageName: ""),
                    Ingredient(name: "Apple", imageName: ""),
                    Ingredient(name: "Plain Yogurt", imageName: ""),
                    Ingredient(name: "Curry Powder", imageName: "")
                   ], timeToCook: "30min", instructions: [String]())
        ]
        */

    }
}

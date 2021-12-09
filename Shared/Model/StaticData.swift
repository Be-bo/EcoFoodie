//
//  Data.swift
//  EcoShopper
//
//  Created by robert on 2021-11-17.
//

import Foundation

final class StaticData{
    
    // MARK: Ingredient Vars
    var IngredientCategories: [String] = [String]()
    var AppleIngredient: Ingredient
    var BlackPepperIngredient: Ingredient
    var BroccoliIngredient: Ingredient
    var BurgerBunIngredient: Ingredient
    var CaramelSauceIngredient: Ingredient
    var CarrotIngredient: Ingredient
    var CheeseIngredient: Ingredient
    var ChickenLegIngredient: Ingredient
    var CornIngredient: Ingredient
    var EggIngredient: Ingredient
    var GarlicIngredient: Ingredient
    var GreenBeanIngredient: Ingredient
    var GreenPepperIngredient: Ingredient
    var LinguiniIngredient: Ingredient
    var OliveOilIngredient: Ingredient
    var OnionIngredient: Ingredient
    var PrawnIngredient: Ingredient
    var RiceIngredient: Ingredient
    var SalmonIngredient: Ingredient
    var SaltIngredient: Ingredient
    var ScollionIngredient: Ingredient
    var ShrimpIngredient: Ingredient
    var SoySauceIngredient: Ingredient
    var TomatoIngredient: Ingredient
    var FoieGrasIngredient: Ingredient
    var RedWineSauceIngredient: Ingredient
    var BeefIngredient: Ingredient
    var BasilSauceIngredient: Ingredient
    var ChineseSpicySauce: Ingredient
    var DrySeaweed: Ingredient
    var ScallopIngredient: Ingredient
    

    // MARK: Recipe Vars
    var PrawnCreamSauceRecipe       : Recipe
    var FriedChickenRecipe              : Recipe
    var GyudonRecipe                    : Recipe
    var FoieGrasRecipe                  : Recipe
    var FriedChickenBurgerRecipe         : Recipe
    var SpicyShrimpRecipe                : Recipe
    var SpicyFriedChickenRecipe         : Recipe
    var MincedSalmonRecipe          : Recipe
    var TorchedScallopShrimpRecipe          : Recipe
    var ButterShrimpRecipe           : Recipe
    var AllRecipes: [Recipe] = [Recipe]()
    
    
    // MARK: Allergy Vars
    var DairyAllergy: Allergy
    var ChickenAllergy: Allergy
    var EggAllergy: Allergy
    var PeanutAllergy: Allergy
    var NutAllergy: Allergy
    var ShellfishAllergy: Allergy
    var FishAllergy: Allergy
    var SoyAllergy: Allergy
    var SulfiteAllergy: Allergy
    var WheatAllergy: Allergy
    var CommonAllergies = [Allergy]()
    
    
    // MARK: Category Vars
    var QuickDishesCategory: Category
    var BreakfastCategory: Category
    var DessertCategory: Category
    var GlutenFreeCategory: Category
    var VegetarianCategory: Category
    var MeatCategory: Category
    var SeafoodCategory: Category
    var PartyCategory: Category
    var DateCategory: Category
    var LunchBoxCategory: Category
    var FitnessCategory: Category
    var NorthAmericaCategory: Category
    var AsiaCategory: Category
    var EuropeCategory: Category
    var FusionCategory: Category
    var EggCategory: Category
    var FoodCategories: [Category] = [Category]()
    
    // MARK: Init
    init(){
        
        
        
        
        // MARK: Category Declarations
        
        QuickDishesCategory = Category(name: "Quick Dishes", imageName: "QuickDishesCategory")
        BreakfastCategory = Category(name: "Breakfast", imageName: "BreakfastCategory")
        DessertCategory = Category(name: "Dessert", imageName: "DessertCategory")
        GlutenFreeCategory = Category(name: "Gluten Free", imageName: "GlutenFreeCategory")
        VegetarianCategory = Category(name: "Vegetarian", imageName: "VegetarianCategory")
        MeatCategory = Category(name: "Meat", imageName: "MeatCategory")
        SeafoodCategory = Category(name: "Seafood", imageName: "SeafoodCategory")
        PartyCategory = Category(name: "Party", imageName: "PartyCategory")
        DateCategory = Category(name: "Date", imageName: "DateCategory")
        LunchBoxCategory = Category(name: "Lunch Box", imageName: "LunchBoxCategory")
        FitnessCategory = Category(name: "Fitness", imageName: "FitnessCategory")
        NorthAmericaCategory = Category(name: "North America", imageName: "NorthAmericaCategory")
        AsiaCategory = Category(name: "Asia", imageName: "AsiaCategory")
        EuropeCategory = Category(name: "Europe", imageName: "EuropeCategory")
        FusionCategory = Category(name: "Fusion", imageName: "FusionCategory")
        EggCategory = Category(name: "Egg", imageName: "EggCategory")
        
        FoodCategories.append(QuickDishesCategory)
        FoodCategories.append(BreakfastCategory)
        FoodCategories.append(DessertCategory)
        FoodCategories.append(GlutenFreeCategory)
        FoodCategories.append(VegetarianCategory)
        FoodCategories.append(MeatCategory)
        FoodCategories.append(SeafoodCategory)
        FoodCategories.append(PartyCategory)
        FoodCategories.append(DateCategory)
        FoodCategories.append(LunchBoxCategory)
        FoodCategories.append(FitnessCategory)
        FoodCategories.append(NorthAmericaCategory)
        FoodCategories.append(AsiaCategory)
        FoodCategories.append(EuropeCategory)
        FoodCategories.append(FusionCategory)
        FoodCategories.append(EggCategory)
        
        
        
        
        // MARK: Allergy Declarations
        
        DairyAllergy = Allergy(name: "Dairy", imageName: "DairyAllergy")
        ChickenAllergy = Allergy(name: "Chicken", imageName: "ChickenAllergy")
        EggAllergy = Allergy(name: "Egg", imageName: "EggAllergy")
        PeanutAllergy = Allergy(name: "Peanut", imageName: "PeanutAllergy")
        NutAllergy = Allergy(name: "Nut", imageName: "NutAllergy")
        ShellfishAllergy = Allergy(name: "Shellfish", imageName: "ShellfishAllergy")
        FishAllergy = Allergy(name: "Fish", imageName: "FishAllergy")
        SoyAllergy = Allergy(name: "Soy", imageName: "SoyAllergy")
        SulfiteAllergy = Allergy(name: "Sulfite", imageName: "SulfiteAllergy")
        WheatAllergy = Allergy(name: "Wheat", imageName: "WheatAllergy")
        
        CommonAllergies.append(DairyAllergy)
        CommonAllergies.append(ChickenAllergy)
        CommonAllergies.append(EggAllergy)
        CommonAllergies.append(PeanutAllergy)
        CommonAllergies.append(NutAllergy)
        CommonAllergies.append(ShellfishAllergy)
        CommonAllergies.append(FishAllergy)
        CommonAllergies.append(SoyAllergy)
        CommonAllergies.append(SulfiteAllergy)
        CommonAllergies.append(WheatAllergy)
        
        
        
        
        
        
        // MARK: Ingredient Declarations
        IngredientCategories.append("Produce")
        IngredientCategories.append("Meat")
        IngredientCategories.append("Dairy")
        IngredientCategories.append("Seafood")
        IngredientCategories.append("Canned Goods")
        IngredientCategories.append("Dry Goods")
        IngredientCategories.append("Bakery")
        IngredientCategories.append("Condiments")
        IngredientCategories.append("Beverages")
        IngredientCategories.append("Bakery")
        
        AppleIngredient         = Ingredient(name: "Apple", imageName: "AppleIngredient", category: "Produce")
        BlackPepperIngredient   = Ingredient(name: "Black Pepper", imageName: "BlackPepperIngredient", category: "Condiments")
        BroccoliIngredient      = Ingredient(name: "Broccoli", imageName: "BroccoliIngredient", category: "Produce")
        BurgerBunIngredient         = Ingredient(name: "Burger Bun", imageName: "BurgerBunIngredient", category: "Bakery")
        CaramelSauceIngredient      = Ingredient(name: "Caramel Sauce", imageName: "CaramelSauceIngredient", category: "Condiments")
        CarrotIngredient         = Ingredient(name: "Carrot", imageName: "CarrotIngredient", category: "Produce")
        CheeseIngredient        = Ingredient(name: "Cheese", imageName: "CheeseIngredient", category: "Dairy")
        ChickenLegIngredient        = Ingredient(name: "Chicken Leg", imageName: "ChickenLegIngredient", category: "Meat")
        CornIngredient           = Ingredient(name: "Corn", imageName: "CornIngredient", category: "Produce")
        EggIngredient            = Ingredient(name: "Egg", imageName: "EggIngredient", category: "Dairy")
        GarlicIngredient        = Ingredient(name: "Garlic", imageName: "GarlicIngredient", category: "Produce")
        GreenBeanIngredient         = Ingredient(name: "Green Bean", imageName: "GreenBeanIngredient", category: "Produce")
        GreenPepperIngredient    = Ingredient(name: "Green Pepper", imageName: "GreenPepperIngredient", category: "Produce")
        LinguiniIngredient      = Ingredient(name: "Linguini", imageName: "LinguiniIngredient", category: "Dry Goods")
        OliveOilIngredient       = Ingredient(name: "Olive Oil", imageName: "OliveOilIngredient", category: "Condiments")
        OnionIngredient             = Ingredient(name: "Onion", imageName: "OnionIngredient", category: "Produce")
        PrawnIngredient          = Ingredient(name: "Prawn", imageName: "PrawnIngredient", category: "Meat")
        RiceIngredient           = Ingredient(name: "Rice", imageName: "RiceIngredient", category: "Dry Goods")
        SalmonIngredient             = Ingredient(name: "Salmon", imageName: "SalmonIngredient", category: "Meat")
        SaltIngredient           = Ingredient(name: "Salt", imageName: "SaltIngredient", category: "Condiments")
        ScollionIngredient           = Ingredient(name: "Scollion", imageName: "ScollionIngredient", category: "Produce")
        ShrimpIngredient            = Ingredient(name: "Shrimp", imageName: "ShrimpIngredient", category: "Meat")
        SoySauceIngredient          = Ingredient(name: "Soy Sauce", imageName: "SoySauceIngredient", category: "Condiments")
        TomatoIngredient            = Ingredient(name: "Tomato", imageName: "TomatoIngredient", category: "Produce")
        FoieGrasIngredient              = Ingredient(name: "Foie Gras", imageName: "IngredientPlaceholder", category: "Meat")
        BeefIngredient          = Ingredient(name: "Beef", imageName: "IngredientPlaceholder", category: "Meat")
        RedWineSauceIngredient   = Ingredient(name: "Red Wine Sauce", imageName: "IngredientPlaceholder", category: "Condiments")
        BasilSauceIngredient             = Ingredient(name: "Basil Sauce", imageName: "IngredientPlaceholder", category: "Condiments")
        ChineseSpicySauce       = Ingredient(name: "Chinese Spicy Sauce", imageName: "IngredientPlaceholder", category: "Condiments")
        DrySeaweed            = Ingredient(name: "Dry Seaweed", imageName: "IngredientPlaceholder", category: "Dry Goods")
        ScallopIngredient       = Ingredient(name: "Scallop", imageName: "IngredientPlaceholder", category: "Meat")
        
        
        
        AppleIngredient       .setQuantity(quantity: 1, units: "pieces")
        BlackPepperIngredient .setQuantity(quantity: 1, units: "tsp")
        BroccoliIngredient    .setQuantity(quantity: 1, units: "lbs")
        BurgerBunIngredient   .setQuantity(quantity: 1, units: "bun")
        CaramelSauceIngredient.setQuantity(quantity: 1, units: "oz")
        CarrotIngredient      .setQuantity(quantity: 1, units: "lbs")
        CheeseIngredient      .setQuantity(quantity: 100, units: "g")
        ChickenLegIngredient  .setQuantity(quantity: 1, units: "pieces")
        CornIngredient        .setQuantity(quantity: 100, units: "g")
        EggIngredient         .setQuantity(quantity: 1, units: "pieces")
        GarlicIngredient      .setQuantity(quantity: 1, units: "pieces")
        GreenBeanIngredient   .setQuantity(quantity: 1, units: "lbs")
        GreenPepperIngredient .setQuantity(quantity: 1, units: "pieces")
        LinguiniIngredient    .setQuantity(quantity: 100, units: "g")
        OliveOilIngredient    .setQuantity(quantity: 1, units: "oz")
        OnionIngredient       .setQuantity(quantity: 1, units: "pieces")
        PrawnIngredient       .setQuantity(quantity: 1, units: "lbs")
        RiceIngredient        .setQuantity(quantity: 100, units: "g")
        SalmonIngredient      .setQuantity(quantity: 1, units: "lbs")
        SaltIngredient        .setQuantity(quantity: 1, units: "tsp")
        ScollionIngredient    .setQuantity(quantity: 1, units: "lbs")
        ShrimpIngredient      .setQuantity(quantity: 1, units: "lbs")
        SoySauceIngredient    .setQuantity(quantity: 1, units: "oz")
        TomatoIngredient      .setQuantity(quantity: 1, units: "lbs")
        FoieGrasIngredient    .setQuantity(quantity: 1, units: "lbs")
        BeefIngredient        .setQuantity(quantity: 1, units: "lbs")
        RedWineSauceIngredient.setQuantity(quantity: 1, units: "oz")
        BasilSauceIngredient  .setQuantity(quantity: 1, units: "oz")
        ChineseSpicySauce     .setQuantity(quantity: 1, units: "oz")
        DrySeaweed            .setQuantity(quantity: 1, units: "tsp")
        ScallopIngredient     .setQuantity(quantity: 1, units: "lbs")
        
        
        
        
        
        // MARK: Recipe Declarations
        
        PrawnCreamSauceRecipe =
        Recipe(name: "Prawn Cream Sauce Linguini",
               imageName: "PrawnCreamSauceLinguini",
               ingredients: [LinguiniIngredient, PrawnIngredient, OnionIngredient, GarlicIngredient, BlackPepperIngredient,
                            SaltIngredient, SoySauceIngredient, CheeseIngredient, OliveOilIngredient], timeToCook: "30min",
               instructions: [
                "Clean prawns with water. Peel the prawns.",
                "Season the prawns with black pepper, salt, and soy sauce. Leave them in the fridge for 10 mins.",
                "When your prawns are in the fridge, heat up some water. Put Linguini in after the water is boiling. Cook for 7 mins. Then turn off the heat and pour the water away.",
                "Cut onion and garlic into small pieces.",
                "Heat a pan. Put half of the olive oil, half of the sliced onion, and half of the garlic in until the pan is hot. Stir for 30 seconds.",
                "Add Linguini and Alfredo sauce in. Stir until mixed.",
                "Add cheese in. Mix it with the Linguini. Add some salt and pepper to season as you like.",
                "Heat another pan. Put the other half olive oil, sliced onion and garlic in. Wait for the pan to be hot and add prawns in. Stir fry until the prawns turn red and seem golden on the surface.",
                "Put mixed green on a dish, then add Linguini and prawns to finish the dish."
               ])
        
        FriedChickenRecipe =
        Recipe(name: "Fried Chicken with Rice", imageName: "FriedChickenWithRice", ingredients: [RiceIngredient, EggIngredient, CarrotIngredient, BroccoliIngredient, ChickenLegIngredient, BlackPepperIngredient, SaltIngredient, SoySauceIngredient, ScollionIngredient, GarlicIngredient, CornIngredient, OliveOilIngredient], timeToCook: "50min", instructions: [
            "Chop chicken legs into pieces. Chop scallion and garlic.",
            "Season chopped chicken legs with black pepper, salt, chopped scallion and garlic. Rest for 30 mins.",
            "Steam the rice with 1:1 rice and water.",
            "Mix an egg in a bowl. Add corn powder to another bowl. Dip the seasoned chicken into the egg first, then the corn powder.",
            "Heat up the oil. Put chicken in when it’s 350F. Deep fry them for 9 mins. Dry the oil on fried chicken with kitchen tissues when the chicken is ready.",
            "Cut carrot into slices. Cut broccoli into small pieces.",
            "Heat up some water. Put carrot and broccoli in after the water is boiling. Cook for one minute. Dry them after they are cooked.",
            "Put the rice in a bowl. Add the fried chicken and cooked vegetables to it. Add Japanese BBQ sauce."
        ])
        
        
        GyudonRecipe = Recipe(name: "Gyudon", imageName: "Gyudon", ingredients: [RiceIngredient, OnionIngredient, CarrotIngredient, BroccoliIngredient, SaltIngredient, OliveOilIngredient, BeefIngredient], timeToCook: "20min", instructions: [
            "Steam the rice with 1:1 rice and water.",
            "Cut onion into slices. Cut carrot into slices. Cut broccoli into small pieces.",
            "Heat a pan. Add olive oil and onion into it until it’s hot. Stir for 1 minute.",
            "Add Japanese BBQ sauce and mix for another one minute.",
            "Add some water into the pan to the half height of the beef. Taste the beef and add some salt if you want. Cook for another one minute and done.",
            "Heat up some water. Put carrot and broccoli in after the water is boiling. Cook for one minute. Dry them after they are cooked.",
            "Put the rice in a bowl. Add the beef and cooked vegetables to it. Add Japanese BBQ sauce."
        ])
        
        
        FoieGrasRecipe = Recipe(name: "Foie Gras with Rice", imageName: "FoieGrasWithRice", ingredients: [RiceIngredient, AppleIngredient, CaramelSauceIngredient, GreenBeanIngredient, OliveOilIngredient, FoieGrasIngredient], timeToCook: "20min", instructions: [
            "Steam the rice with 1:1 rice and water.",
            "Cut apple into slices.",
            "Heat a pan. Add sliced apple and caramel sauce in it after it’s hot. Boil for 2 mins.",
            "Heat another pan. Add olive oil in it. Add foie gras in it after it’s hot. Sear both sides until they turn golden brown.",
            "Put the rice in a bowl. Add the foie gras and caramel apple to it. Add red wine sauce."
        ])
        
        
        FriedChickenBurgerRecipe = Recipe(name: "Fried Chicken Burger with Basil Sauce", imageName: "FriedChickenBurgerWithBasilSauce", ingredients: [ChickenLegIngredient, BlackPepperIngredient, SaltIngredient, SoySauceIngredient, EggIngredient, CornIngredient, BurgerBunIngredient, TomatoIngredient, OliveOilIngredient, BasilSauceIngredient], timeToCook: "50min", instructions: [
            "Season boneless chicken thigh steak with black pepper, salt, and soy sauce. Rest for 30 mins.",
            "Mix an egg in a bowl. Add corn powder to another bowl. Rinse the seasoned chicken in the egg first, then the corn powder.",
            "Heat up the oil. Put chicken in when it’s 350F. Deep fry them for 9 mins. Dry the oil on fried chicken with kitchen tissues when the chicken is ready.",
            "Heat a pan. Sear burger bon in hot pan until the surface gets a little crispy.",
            "Cut the tomato into slices.",
            "Put the bottom bon on a dish, then add basil sauce, mixed green, sliced tomato, chicken steak, basil sauce and the top bon to finish the burger."
        ])
        
        
        SpicyShrimpRecipe = Recipe(name: "Spicy Shrimp", imageName: "SpicyShrimp", ingredients: [ShrimpIngredient, OnionIngredient, OliveOilIngredient, GarlicIngredient, GreenPepperIngredient, SaltIngredient, BlackPepperIngredient], timeToCook: "15min", instructions: [
            "Clean and peel shrimps.",
            "Cut onion, garlic and green pepper into slices.",
            "Heat a pan. Add oil into the pan. Add sliced onion, garlic and green pepper into it after the oil is hot.",
            "With high heat, add shrimps in it. Add spicy sauce and chili oil in it and mix well. Stir until the shrimps turn red and well cooked.",
            "Finish cooking. Serve in a dish."
        ])
        
        
        SpicyFriedChickenRecipe = Recipe(name: "Spicy Fried Chicken with Rice", imageName: "SpicyFriedChickenWithRice", ingredients: [ChickenLegIngredient, BlackPepperIngredient, SaltIngredient, SoySauceIngredient, EggIngredient, CornIngredient, OliveOilIngredient, RiceIngredient, OnionIngredient, GarlicIngredient, ChineseSpicySauce], timeToCook: "50min", instructions: [
            "Season boneless chicken thigh steak with black pepper, salt, onion powder, garlic powder and soy sauce. Rest for 30 mins.",
            "Steam the rice with 1:1 rice and water.",
            "Mix an egg in a bowl. Add corn powder to another bowl. Rinse the seasoned chicken in the egg first, then the corn powder.",
            "Heat up the oil. Put chicken in when it’s 350F. Deep fry them for 9 mins. Dry the oil on fried chicken with kitchen tissues when the chicken is ready.",
            "Cut chicken into pieces.",
            "Put rice in a bowl. Add Chicken onto it. Then add the spicy sauce for chili flavor."
        ])
        
        
        MincedSalmonRecipe = Recipe(name: "Minced Salmon with Rice", imageName: "MincedSalmonWithRice", ingredients: [RiceIngredient, SalmonIngredient, SaltIngredient, BlackPepperIngredient, CornIngredient, SoySauceIngredient, OliveOilIngredient], timeToCook: "20min", instructions: [
            "Steam the rice with 1:1 rice and water.",
            "Rinse the salmon with water and dry.",
            "Chop salmon into small pieces.",
            "Heat a pan. Put olive oil and salmon in it until it’s hot. Stir for one minute.",
            "Add salt and pepper. Mix well. Taste the flavor and add more if needed.",
            "Stir and mince the salmon until it’s almost dry.",
            "Mix wasabi, soy sauce and mayonnaise together.",
            "Put the rice in the bowl. Add minced salmon onto it. Then add mixed sauce, dry seaweed and corn onto the top."
        ])
        
        TorchedScallopShrimpRecipe = Recipe(name: "Torched Scallop and Shrimp", imageName: "TorchedScallopAndShrimp", ingredients: [ShrimpIngredient, OliveOilIngredient, SaltIngredient, BlackPepperIngredient, ScallopIngredient], timeToCook: "10min", instructions: [
            "Heat a pan. Add olive oil, shrimps and scallop until it’s hot.",
            "Add salt and pepper to both sides of the shrimps and scallops.",
            "Stir until the shrimps turn red mostly and the surface of scallops turns golden brown. Turn off the oven.",
            "Use torch to torch the shrimps and scallops for a few seconds.",
            "Place the mixed green on a plate and then put shrimps and scallops on it. Add BBQ sauce for more flavor."
        ])
        
        
        ButterShrimpRecipe = Recipe(name: "Butter Shrimp", imageName: "ButterShrimp", ingredients: [ShrimpIngredient, OnionIngredient, OliveOilIngredient, GarlicIngredient, GreenPepperIngredient, SaltIngredient, BlackPepperIngredient], timeToCook: "15min", instructions: [
            "Clean and peel shrimps.",
            "Cut onion, garlic and green pepper into slices. Chop coriander.",
            "Heat a pan. Add oil into the pan. Add butter, sliced onion, garlic, green pepper and Italian mixed herbs into it after the oil is hot.",
            "With high heat, add shrimps in it. Add salt and pepper in it and mix well. Stir until the shrimps turn red and well cooked.",
            "Finish cooking. Serve in a dish with chopped coriander on top of it."

        ])
        
        AllRecipes.append(PrawnCreamSauceRecipe     )
        AllRecipes.append(FriedChickenRecipe        )
        AllRecipes.append(GyudonRecipe              )
        AllRecipes.append(FoieGrasRecipe            )
        AllRecipes.append(FriedChickenBurgerRecipe  )
        AllRecipes.append(SpicyShrimpRecipe         )
        AllRecipes.append(SpicyFriedChickenRecipe   )
        AllRecipes.append(MincedSalmonRecipe        )
        AllRecipes.append(TorchedScallopShrimpRecipe)
        AllRecipes.append(ButterShrimpRecipe        )
        
        
    }
    
}

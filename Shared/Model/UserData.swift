//
//  UserData.swift
//  EcoShopper
//
//  Created by robert on 2021-11-04.
//

import Foundation

class UserData: Identifiable, ObservableObject{
    @Published var plannedMeals = [Recipe]() //recipes added to meal plan
    @Published var boughtMeals = [Recipe]() //recipes from plannedMeals where all ingredients are present
    @Published var notBoughtMeals = [Recipe]() //recipes from plannedMeals where not all ingredients are present
    @Published var useUpRecipes = [Recipe]() //recipe suggestions for the "Use Up" category
    @Published var shoppingList = [Ingredient]() //all ingredients on the shopping list
    @Published var inCartIngredientIds = [String]() //ids of all ingredients that have been marked as bought in shopping list
    @Published var pantry = [Ingredient]() //all ingredients in pantry
    @Published var onBoardingDone = false
    @Published var allergies = [Allergy]()
    @Published var defaultPortionsNumber: Int = 1 //default meal plan portions for each newly added recipe
    @Published var planNotificationCount: Int = 0
    @Published var listNotificationCount: Int = 0
    @Published var profileNotificationCount: Int = 0
    @Published var totalIngredientsSaved: Int = 0 //total number of pantry ingredients used up
    @Published var totalAwards: Int = 0
    var staticData: StaticData = StaticData()
    
    init(){
    }
    
    
    
    

    // MARK: Plan Functions
    
    /// Removes the given recipe from user's meal plan appropriately.
    /// - Parameter removedRecipe: Recipe/meal to remove from meal plan.
    func removeFromPlan(removedRecipe: Recipe){
        
        var ingrsToRem = [String]() // ingredients to mark for removal
        
        // update shopping list quantities
        for ingredient in shoppingList{
            if(removedRecipe.ingredients.contains(where: { ingr in
                return ingr.nameId == ingredient.nameId
            })){
                ingredient.amount -= removedRecipe.portionNumber
                if(ingredient.amount < 1){
                    ingrsToRem.append(ingredient.nameId)
                }
            }
        }
        
        // remove all ingredients with quantity 0
        while ingrsToRem.count > 0{
            shoppingList.removeAll { ingr in
                return ingr.nameId == ingrsToRem[0]
            }
            ingrsToRem.remove(at: 0)
        }
        
        
        // remove recipe from meal plan
        if let indexToRemove = plannedMeals.firstIndex(where: { recip in
            return recip.nameId == removedRecipe.nameId
        }){
            plannedMeals.remove(at: indexToRemove)
        }
        
        // if in boughtMeals, remove also
        if let indexToRemove = boughtMeals.firstIndex(where: { recip in
            return recip.nameId == removedRecipe.nameId
        }){
            boughtMeals.remove(at: indexToRemove)
        }
        
        // if in notBoughtMeals, remove also
        if let indexToRemove = notBoughtMeals.firstIndex(where: { recip in
            return recip.nameId == removedRecipe.nameId
        }){
            notBoughtMeals.remove(at: indexToRemove)
        }
    }
    
    /// Adds a new recipe/meal to user's meal plan appropriately
    /// - Parameter newMeal: New recipe to add.
    func addToMealPlan(newRecipe: Recipe){
        newRecipe.portionNumber = defaultPortionsNumber
        plannedMeals.append(newRecipe)
        addRecipeToBoughtOrNotBoughtList(recipe: newRecipe)
    }
    
    /// Adds a given recipe to boughtMeals or notBoughtMeals correctly.
    /// Also sets the recipe's status in order to display it correctly in the Plan tab.
    /// - Parameter recipe: Recipe to add to bought or notBought list.
    private func addRecipeToBoughtOrNotBoughtList(recipe: Recipe){
        
        // find out if all ingredients are present in pantry for this recipe
        var allIngrPresent = true
        for plannedMealIngr in recipe.ingredients{
            if(!pantry.contains(where: { pantryIngr in
                return pantryIngr.nameId == plannedMealIngr.nameId
            })){
                allIngrPresent = false
                break
            }
        }
        
        // set the recipe's status & add it to boughtMeals or notBoughtMeals appropriately
        if(allIngrPresent){
            recipe.planStatus = "All ingredients present!"
            boughtMeals.append(recipe)
        }else{
            if(recipe.ingredientsAdded){
                recipe.planStatus = "Ingredients in shopping cart."
            }else{
                recipe.planStatus = "Ingredients missing."
            }
            notBoughtMeals.append(recipe)
        }
    }
    
    
    /// Populates the useUpRecipes array with recipes not on user's meal plan based on highest ingredient availability.
    func updateUseUpRecipes(){
        useUpRecipes = [Recipe]()
        var recipeIdToPercentageInPantryPairs = [String : Float]()
        
        // remove all recipes that are already on our meal plan
        for mealPlanRecip in plannedMeals{
            if let indx = staticData.AllRecipes.firstIndex(where: { statRec in
                return statRec.nameId == mealPlanRecip.nameId
            }){
                staticData.AllRecipes.remove(at: indx)
            }
        }
        
        // for each available recipe save a pair of recipe id : (ingredients available in pantry / total ingredients requires)
        for recipe in staticData.AllRecipes{
            var ingredientsAvailable = 0.0
            for ingredient in recipe.ingredients{
                if(pantry.contains(where: { pantryIngr in
                    return pantryIngr.nameId == ingredient.nameId
                })){
                    ingredientsAvailable += 1.0
                }
            }
            recipeIdToPercentageInPantryPairs[recipe.nameId] = Float((Float(ingredientsAvailable)/Float(recipe.ingredients.count)))
        }
        
        
        // sort the recipe : ingredient availability percentage array, descendignly & based on the percentage
        let sortedPairs = recipeIdToPercentageInPantryPairs.sorted { pair1, pair2 in
            return pair1.value >= pair2.value
        }
        
        // add five recipes with highest availability to the use up recipe list descendigly
        for indx in 0..<5 {
            if(indx >= sortedPairs.count || sortedPairs[indx].value <= 0){ //stop adding if there isn't enough recipes or if we're about to start adding recipes we don't have any ingredients for
                break
            }
            if let firstIndx = staticData.AllRecipes.firstIndex(where: { recip in
                recip.nameId == sortedPairs[indx].key
            }){
                useUpRecipes.append(staticData.AllRecipes[firstIndx])
            }
        }
    }
    
    
    
    
    
    
    // MARK: Ingredient Functions
    
    /// Updates amount for each ingredient of the given recipe.
    /// - Parameters:
    ///   - recipeId: The name id of the recipe to update.
    ///   - newAmount: Ingredient amount after update.
    func changeIngredientAmount(recipeId: String, newAmount: Int){
        if let indx = notBoughtMeals.firstIndex(where: { rcp in
            return rcp.nameId == recipeId
        }){
            
            // all ingredients for this recipe that are on the shopping list
            for ingr in shoppingList{
                if(notBoughtMeals[indx].ingredients.contains(where: { ing in
                    return ing.nameId == ingr.nameId
                })){
                    
                    // subtract the old, add the new
                    ingr.amount -= notBoughtMeals[indx].portionNumber
                    ingr.amount += newAmount
                }
            }
            
            // update the default number in the notBoughtMeals list (that one is used to display all recipes in "ingredients added" stage)
            notBoughtMeals[indx].portionNumber = newAmount
        }
    }
    
    
    /// Removes all marked ingredients from the Shopping List & adds them to pantry.
    /// Reevaluates (& updates accordingly) which recipes have their ingredients present and which don't.
    func fillPantry(){
        
        // move all marked ingredients from the shopping cart to the pantry
        while inCartIngredientIds.count > 0{
            for indx in 0..<shoppingList.count{
                if(inCartIngredientIds[0] == shoppingList[indx].nameId){
                    pantry.append(shoppingList[indx])
                    shoppingList.remove(at: indx)
                    inCartIngredientIds.remove(at: 0)
                    break
                }
            }
        }
        
        // update boughtList & notBoughtList appropriately for each recipe on the meal plan
        boughtMeals = [Recipe]()
        notBoughtMeals = [Recipe]()
        for plannedMeal in plannedMeals{
            addRecipeToBoughtOrNotBoughtList(recipe: plannedMeal)
        }
        updateUseUpRecipes()
    }
    
    
    /// Adds all ingredients of the specified recipe to the shopping list.
    /// - Parameter newRecipe: The recipe whose ingredients should be added to the shopping list.
    func addToShoppingList(newRecipe: Recipe){
    
        // update amounts for existing ingredients
        for ingredient in shoppingList{
            if(newRecipe.ingredients.contains(where: { ingr in
                return ingr.nameId == ingredient.nameId
            })){
                ingredient.amount = ingredient.amount + newRecipe.portionNumber
            }
        }
        
        // add new ingredients this recipe introduces
        for ingredient in newRecipe.ingredients{
            if(!shoppingList.contains(where: { ingr in
                return ingr.nameId == ingredient.nameId
            })){
                ingredient.amount = newRecipe.portionNumber
                shoppingList.append(ingredient)
            }
        }
    }
    
    /// Adds an individual ingredient to the shopping cart and moves it to the end of the shopping list.
    /// - Parameter ingredient: The ingredient to add.
    func addToCart(ingredient: Ingredient){
        shoppingList.removeAll { ingr in
            return ingr.nameId == ingredient.nameId
        }
        shoppingList.append(ingredient)
        inCartIngredientIds.append(ingredient.nameId)
    }
    
    /// Removes the specified ingredient from the shopping cart and moves it to the beginning of the shopping list.
    /// - Parameter ingredient: The ingredient to remove.
    func removeFromCart(ingredient:Ingredient){
        shoppingList.removeAll { ingr in
            return ingr.nameId == ingredient.nameId
        }
        shoppingList.insert(ingredient, at: 0)
        inCartIngredientIds.removeAll { ingrId in
            return ingrId == ingredient.nameId
        }
    }
    

    
    
    
    // MARK: Other Functions
    
    /// Increases the total number of saved ingredients by the specified integer & updates the award number accordingly.
    /// - Parameter howMany: The number to add to the current total saved ingredient amount.
    func addSavedIngredients(howMany: Int){
        totalIngredientsSaved += howMany
        updateAwardCount()
    }
    
    /// Decreses the total number of saved ingredients by the specified integer & updates the award number accordingly.
    /// - Parameter howMany: The number to subtract from the current total ingredient saved amount.
    func removeSavedIngredients(howMany: Int){
        totalIngredientsSaved -= howMany
        updateAwardCount()
    }
    
    /// Updates  total award amount based on the total number of saved ingredients.
    func updateAwardCount(){
        totalAwards = totalIngredientsSaved / Int.awardIngredientAmount
    }
    
    /// Sets the onboarding bool to true so that the user doesn't have to go through onboarding again next time.
    func setOnboardingDone(){
        onBoardingDone = true
    }
    
    /// Adds a new allergy to the user's list of allergies.
    /// - Parameter allergy: Allergy to add.
    func addAllergy(allergy: Allergy){
        allergies.append(allergy)
    }
    
    
    
    
    
    
    
//    private func loadLocalData(){
//        if let plannedMealsData = UserDefaults.standard.data(forKey: "plannedMeals"){
//            if let decodedPlannedMeals = try? JSONDecoder().decode([Recipe].self, from: plannedMealsData){
//                plannedMeals = decodedPlannedMeals
//            }
//        }
//
//
//        if let shoppingListData = UserDefaults.standard.data(forKey: "shoppingList"){
//            if let decodedShoppingList = try? JSONDecoder().decode([Ingredient].self, from: shoppingListData){
//                shoppingList = decodedShoppingList
//            }
//        }
//    }
//
//    private func savePlannedMeals(){
//        if let encodedMealPlans = try? JSONEncoder().encode(plannedMeals){
//            UserDefaults.standard.set(encodedMealPlans, forKey: "plannedMeals")
//        }
//    }
//
//    private func saveShoppingList(){
//        if let encodedShoppingList = try? JSONEncoder().encode(shoppingList){
//            UserDefaults.standard.set(encodedShoppingList, forKey: "shoppingList")
//        }
//    }
}

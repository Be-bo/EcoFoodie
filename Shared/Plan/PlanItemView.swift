//
//  PlanItemView.swift
//  EcoShopper
//
//  Created by robert on 2021-12-05.
//

import SwiftUI

struct PlanItemView: View {
    @EnvironmentObject var userData: UserData
    @Binding var showRecipeModal: Bool
    @Binding var selectedRecipe: Recipe
    @Binding var toastMessage: String
    @Binding var toastShowing: Bool
    @Binding var cookingModeShowing: Bool
    @State var tempPortionNumber: Int
    var recipe: Recipe
    
    
    var body: some View {
        
        VStack{
            
            // MARK: Image & Info
            HStack{
                Image(recipe.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: CGFloat.imageItemSizeDimen, height: CGFloat.imageItemSizeDimen)
                    .cornerRadius(20)
                
                VStack(alignment: .leading){
                    HStack{
                        Text(recipe.nameId)
                            .font(.system(size: CGFloat.defaultFontSize))
                            .bold()
                            .lineLimit(3)
                        
                        Spacer()
                        
                        Image(systemName: "xmark")
                            .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                            .foregroundColor(.green)
                            .onTapGesture {
                                userData.removeFromPlan(removedRecipe: recipe)
                            }
                    }

                    
                    Text("Ingredients: \(recipe.ingredientString)")
                        .lineLimit(4)
                        .font(.system(size:CGFloat.defaultFontSize))
                    
                    Text("Time: \(recipe.timeToCook)")
                        .font(.system(size:CGFloat.defaultFontSize))
                }
            }
            .padding(.leading, CGFloat.halfPadding)
            .padding(.trailing, CGFloat.halfPadding)
            .padding(.top, CGFloat.halfPadding)
            .onTapGesture {
                showRecipeModal = true
                selectedRecipe = recipe
            }
            
            
            
            // MARK: Quantity & Add Btns
            HStack{
                
                if(!userData.boughtMeals.contains(where: { rcp in
                    return recipe.nameId == rcp.nameId
                })){
                    HStack(){
                        Button(action: {
                            if(tempPortionNumber > 1){
                                tempPortionNumber -= 1
                            }
                        }) {
                            Image(systemName: "minus.circle.fill")
                                .resizable()
                                .frame(width: 25, height:25)
                                .foregroundColor(Color.green)
                        }
                        
                        Spacer()
                        Text("\(tempPortionNumber) srv")
                        Spacer()
                        
                        Button(action: {
                            if(tempPortionNumber < 20){
                                tempPortionNumber += 1
                            }
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 25, height:25)
                                .foregroundColor(Color.green)
                        }
                    }
                    .frame(width: CGFloat.imageItemSizeDimen)
                }


                Spacer()
                
                
                Button {
                    if (userData.boughtMeals.contains(where: { recip in //all ingredients present
                        return recip.nameId == recipe.nameId
                    })){
                        cookingModeShowing = true
                        
                    }else if (recipe.ingredientsAdded){ //ingredients not present but have been added to shopping list
                        userData.changeIngredientAmount(recipeId: recipe.nameId, newAmount: tempPortionNumber)
                        toastMessage = "Quantity changed."
                        toastShowing = true
                        
                    }else{ //ingredients not bought and also not on shopping list
                        recipe.ingredientsAdded = true
                        recipe.portionNumber = tempPortionNumber
                        userData.listNotificationCount += recipe.ingredients.count
                        userData.addToShoppingList(newRecipe: recipe)
                        toastMessage = "Recipe added to shopping list."
                        toastShowing = true
                    }
                    
                } label: {
                    Text(userData.boughtMeals.contains(where: { recip in
                        return recip.nameId == recipe.nameId
                    }) ? "Cooking Mode" : (recipe.ingredientsAdded ? "Change Amount" : "Add to Shopping List"))
                        .foregroundColor(Color.black)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                .frame(height: 40)
                .background(Color(red: 255/255, green: 192/255, blue: 79/255))
                .cornerRadius(20)
            }
            .padding(CGFloat.halfPadding)

        }
        .background(Color.white)
        .cornerRadius(CGFloat.smallCornerRadius)
        .shadow(radius: 5)
        .overlay {
            
            if(userData.boughtMeals.contains(where: { rcp in //all ingredients present
                return recipe.nameId == rcp.nameId
            })){
                RoundedRectangle(cornerRadius: CGFloat.smallCornerRadius)
                    .stroke(Color.primaryGreen, lineWidth: CGFloat.planItemBorderWidth)
                
            }else if(recipe.ingredientsAdded){
                RoundedRectangle(cornerRadius: CGFloat.smallCornerRadius)
                    .stroke(Color.shoppingListYellow, lineWidth: CGFloat.planItemBorderWidth)
                
            }else{
                RoundedRectangle(cornerRadius: CGFloat.smallCornerRadius)
                    .stroke(Color.otherMealsBrown, lineWidth: CGFloat.planItemBorderWidth)
            }
        }
        .padding(.top, CGFloat.defaultPadding)
    }
}

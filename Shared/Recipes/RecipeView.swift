//
//  RecipeView.swift
//  EcoShopper
//
//  Created by robert on 2021-10-28.
//

import SwiftUI

struct RecipeView: View {
    @StateObject var viewModel = RecipeViewModel()
    @EnvironmentObject var userData: UserData
    @State private var showRecipeModal = false
    @State private var selectedRecipe = Recipe(name: "Empty", imageName: "Placeholder", ingredients: [Ingredient](), timeToCook: "30min", instructions: [String]())
    @State var updatePromptHidden = false
    @State var pantryShowing = false
    @State var toastShowing = false
    @State var toastMessage = "Recipe added to your Planned Meals."
    
    var body: some View {
        
        ZStack{
            
            // MARK: Pantry
            if(pantryShowing){
                PantryView(isShowing: $pantryShowing)
            }else{
                
                VStack{
                    // MARK: Header with Tabs
                    Group{
                        Image("Header")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Recipes")
                            .font(.title)
                        HStack{
                            
                            Text("Inspiration")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .multilineTextAlignment(.center)
                                .frame(width: 110)
                            
                            Text("For You")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .underline(color: Color.primaryGreen)
                                .multilineTextAlignment(.center)
                                .frame(width: 110)
                            
                            Text("All Categories")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .multilineTextAlignment(.center)
                                .frame(width: 110)
                            
                        }
                        .padding(.top, CGFloat.innerSectionPadding)
                        
                        
                        
                        ScrollView{
                            VStack{
                                
                                // MARK: Use Up Section
                                if(userData.useUpRecipes.count > 0 && userData.pantry.count > 0){
                                    Group{
                                        HStack{
                                            Text("Use Up What You Have")
                                                .font(.title2)
                                                .bold()
                                            Spacer()
                                        }
                                        .padding(.leading, CGFloat.defaultPadding)
                                        .padding(.top, CGFloat.sectionPadding)
                                        
                                        HStack{
                                            Text("Based on ingredients you have at home")
                                                .font(.caption)
                                            Spacer()
                                        }
                                        .padding(.leading, CGFloat.defaultPadding)
                                        
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 0) {
                                                ForEach (userData.useUpRecipes) { recipeItem in
                                                    ZStack{
                                                        
                                                        RecipeItemView(recipeItem: userData.useUpRecipes.first(where: { rcp in
                                                            return rcp.nameId == recipeItem.nameId
                                                        })!, showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe)
                                                        
                                                        VStack{
                                                            Spacer()
                                                            HStack{
                                                                Spacer()
                                                                
                                                                Image(systemName: userData.plannedMeals.contains(where: { rcp in
                                                                    return rcp.nameId == recipeItem.nameId
                                                                }) ? "checkmark.circle" : "plus.circle")
                                                                    .resizable()
                                                                    .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                                                                    .background(Color.white.opacity(1.0))
                                                                    .foregroundColor(userData.plannedMeals.contains(where: { rcp in
                                                                        return rcp.nameId == recipeItem.nameId
                                                                    }) ? Color.primaryGreen : Color.black)
                                                                    .clipShape(Circle())
                                                                    .onTapGesture {
                                                                        
                                                                        if(userData.plannedMeals.contains(where: { rcp in
                                                                            return rcp.nameId == recipeItem.nameId
                                                                        })){
                                                                            userData.planNotificationCount -= 1
                                                                            userData.plannedMeals.remove(at: userData.plannedMeals.firstIndex(where: { rcp in
                                                                                return rcp.nameId == recipeItem.nameId
                                                                            })!)
                                                                            toastMessage = "Recipe removed from your Planned Meals"
                                                                        }else{
                                                                            toastMessage = "Recipe added to your Planned Meals"
                                                                            userData.planNotificationCount += 1
                                                                            userData.addToMealPlan(newRecipe: recipeItem)
                                                                        }
                                                                        toastShowing = true
                                                                    }
                                                                
                                                                Spacer()
                                                            }
                                                        }
                                                        .frame(width: CGFloat.imageItemSizeDimen, height: CGFloat.imageItemSizeDimen + 58 + CGFloat.imageButtonSizeDimen)
                                                        .padding(.leading, CGFloat.defaultPadding)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    
                                    
                                    
                                    // MARK: Ingredient List
                                    VStack{
                                        HStack{
                                            Text("Suggestions based on:")
                                                .font(.system(size: CGFloat.defaultFontSize))
                                                .bold()
                                            Spacer()
                                        }
                                        .padding(.leading, CGFloat.defaultPadding)
                                        .padding(.top, CGFloat.innerSectionPadding)
                                        .padding(.bottom, CGFloat.innerSectionPadding)
                   
                                        ScrollView(.horizontal, showsIndicators: false) {
                                            HStack(spacing: 0) {
                                                ForEach (userData.pantry) { ingredient in
                                                    ZStack{
                                                        Image(ingredient.imageName)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(width: 75, height: 75)
                                                            .cornerRadius(CGFloat.smallCornerRadius)
                                                            .padding(0)
                                                    }
                                                    .padding(.leading, CGFloat.defaultPadding)
                                                }
                                            }
                                        }
                                        
                                        VStack{
                                            HStack{
                                                Text("Need to update?")
                                                    .font(.title2)
                                                    .bold()
                                                Spacer()
                                            }
                                            .padding(.leading, CGFloat.innerSectionPadding)
                                            .padding(.top, CGFloat.innerSectionPadding)
                                            .padding(.trailing, CGFloat.innerSectionPadding)
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Button(action: {
                                                    pantryShowing = true
                                                }) {
                                                    Text("Go to My Ingredients")
                                                        .font(.system(size: CGFloat.defaultFontSize))
                                                        .bold()
                                                        .foregroundColor(Color.primaryGreen)
                                                }
                                                .padding(.trailing, CGFloat.innerSectionPadding)
                                                .padding(.bottom, CGFloat.innerSectionPadding)
                                                .padding(.top, CGFloat.miniPadding)
                                            }
                                        }
                                        .background(Color.white)
                                        .cornerRadius(CGFloat.smallCornerRadius)
                                        .padding(CGFloat.defaultPadding)
                                        .shadow(radius: 5)
                                    }

                                    
                                    
                                    
                                    
                                // MARK: Pantry Suggestion Box
                                }else{
                                    if(!updatePromptHidden){
                                        VStack{
                                            HStack{
                                                Text("Ingredients at home already?")
                                                    .font(.title2)
                                                    .bold()
                                                Spacer()
                                                Image(systemName: "xmark")
                                                    .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                                                    .foregroundColor(.green)
                                                    .onTapGesture {
                                                        updatePromptHidden = true
                                                    }
                                            }
                                            .padding(.leading, CGFloat.halfPadding)
                                            .padding(.top, CGFloat.halfPadding)
                                            .padding(.trailing, CGFloat.halfPadding)
                                            
                                            Text("Add them here so we can suggest recipes based on what you already have.")
                                                .font(.system(size: CGFloat.defaultFontSize))
                                                .padding(.leading, CGFloat.halfPadding)
                                                .padding(.top, CGFloat.halfPadding)
                                                .padding(.trailing, CGFloat.halfPadding)
                                            
                                            HStack{
                                                Spacer()
                                                
                                                Button(action: {
                                                    pantryShowing = true
                                                }) {
                                                    Text("Go to My Ingredients")
                                                        .font(.system(size: CGFloat.defaultFontSize))
                                                        .bold()
                                                        .foregroundColor(Color.primaryGreen)
                                                }
                                                .padding(CGFloat.halfPadding)
                                            }
                                        }
                                        .background(Color.white)
                                        .cornerRadius(CGFloat.smallCornerRadius)
                                        .padding(.leading, CGFloat.defaultPadding)
                                        .padding(.trailing, CGFloat.defaultPadding)
                                        .padding(.top, CGFloat.defaultPadding)
                                        .shadow(radius: 5)
                                    }
                                }
                                
                                
                                
                                
                                // MARK: Quick Dishes Section
                                Group{
                                    HStack{
                                        Text("Quick Dishes")
                                            .font(.title2)
                                            .bold()
                                        Spacer()
                                    }
                                    .padding(.leading, CGFloat.defaultPadding)
                                    .padding(.top, CGFloat.defaultPadding)
                                    
                                    HStack{
                                        Text("Make your next meal in under 20 minutes")
                                            .font(.caption)
                                        Spacer()
                                    }
                                    .padding(.leading, CGFloat.defaultPadding)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 0) {
                                            ForEach (viewModel.quickDishRecipes) { recipeItem in
                                                ZStack{
                                                    
                                                    RecipeItemView(recipeItem: viewModel.quickDishRecipes.first(where: { rcp in
                                                        return rcp.nameId == recipeItem.nameId
                                                    })!, showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe)
                                                    
                                                    VStack{
                                                        Spacer()
                                                        HStack{
                                                            Spacer()
                                                            
                                                            Image(systemName: userData.plannedMeals.contains(where: { rcp in
                                                                return rcp.nameId == recipeItem.nameId
                                                            }) ? "checkmark.circle" : "plus.circle")
                                                                .resizable()
                                                                .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                                                                .background(Color.white.opacity(1.0))
                                                                .foregroundColor(userData.plannedMeals.contains(where: { rcp in
                                                                    return rcp.nameId == recipeItem.nameId
                                                                }) ? Color.primaryGreen : Color.black)
                                                                .clipShape(Circle())
                                                                .onTapGesture {
                                                                    
                                                                    if(userData.plannedMeals.contains(where: { rcp in
                                                                        return rcp.nameId == recipeItem.nameId
                                                                    })){
                                                                        userData.planNotificationCount -= 1
                                                                        userData.plannedMeals.remove(at: userData.plannedMeals.firstIndex(where: { rcp in
                                                                            return rcp.nameId == recipeItem.nameId
                                                                        })!)
                                                                        toastMessage = "Recipe removed from your Planned Meals"
                                                                    }else{
                                                                        toastMessage = "Recipe added to your Planned Meals"
                                                                        userData.planNotificationCount += 1
                                                                        userData.addToMealPlan(newRecipe: recipeItem)
                                                                    }
                                                                    toastShowing = true
                                                                }
                                                            
                                                            Spacer()
                                                        }
                                                    }
                                                    .frame(width: CGFloat.imageItemSizeDimen, height: CGFloat.imageItemSizeDimen + 58 + CGFloat.imageButtonSizeDimen)
                                                    .padding(.leading, CGFloat.defaultPadding)
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                                
                                // MARK: Meat Section
                                Group{
                                    HStack{
                                        Text("Meat")
                                            .font(.title2)
                                            .bold()
                                        Spacer()
                                    }
                                    .padding(.leading, CGFloat.defaultPadding)
                                    .padding(.top, CGFloat.defaultPadding)
                                    HStack{
                                        Text("Hearty dishes for any occassion")
                                            .font(.caption)
                                        Spacer()
                                    }
                                    .padding(.bottom, 0)
                                    .padding(.leading, CGFloat.defaultPadding)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 0) {
                                            ForEach (viewModel.meatRecipes) { recipeItem in
                                                ZStack{
                                                    
                                                    RecipeItemView(recipeItem: viewModel.meatRecipes.first(where: { rcp in
                                                        return rcp.nameId == recipeItem.nameId
                                                    })!, showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe)
                                                    
                                                    VStack{
                                                        Spacer()
                                                        HStack{
                                                            Spacer()
                                                            
                                                            Image(systemName: userData.plannedMeals.contains(where: { rcp in
                                                                return rcp.nameId == recipeItem.nameId
                                                            }) ? "checkmark.circle" : "plus.circle")
                                                                .resizable()
                                                                .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                                                                .background(Color.white.opacity(1.0))
                                                                .foregroundColor(userData.plannedMeals.contains(where: { rcp in
                                                                    return rcp.nameId == recipeItem.nameId
                                                                }) ? Color.primaryGreen : Color.black)
                                                                .clipShape(Circle())
                                                                .onTapGesture {
                                                                    
                                                                    if(userData.plannedMeals.contains(where: { rcp in
                                                                        return rcp.nameId == recipeItem.nameId
                                                                    })){
                                                                        userData.planNotificationCount -= 1
                                                                        userData.plannedMeals.remove(at: userData.plannedMeals.firstIndex(where: { rcp in
                                                                            return rcp.nameId == recipeItem.nameId
                                                                        })!)
                                                                        toastMessage = "Recipe removed from your Planned Meals"
                                                                    }else{
                                                                        toastMessage = "Recipe added to your Planned Meals"
                                                                        userData.planNotificationCount += 1
                                                                        userData.addToMealPlan(newRecipe: recipeItem)
                                                                    }
                                                                    toastShowing = true
                                                                }
                                                                .padding(.leading, CGFloat.defaultPadding)
                                                            
                                                            Spacer()
                                                        }
                                                    }
                                                    .frame(width: CGFloat.imageItemSizeDimen, height: CGFloat.imageItemSizeDimen + 58 + CGFloat.imageButtonSizeDimen)
                                                }
                                            }
                                        }
                                        .padding(.top, 0)
                                    }
                                    .padding(0)
                                }
                                
                                
                                Spacer()
                                    .frame(height: CGFloat.defaultBottomOffset)
                            }
                        }
                    }
                }
                ToastMessage(textMessage: $toastMessage, isShowing: $toastShowing)
                RecipeModal(isShowing: $showRecipeModal, recipe: $selectedRecipe)
            }
            
            
            
        }
        .edgesIgnoringSafeArea(!pantryShowing ? .top : .leading) //
    }
}


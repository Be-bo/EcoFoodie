//
//  PlanView.swift
//  EcoShopper
//
//  Created by robert on 2021-11-04.
//

import SwiftUI

struct PlanView: View {
    @EnvironmentObject var userData: UserData
    @State private var showRecipeModal = false
    @State var ingrsBoughtSelected = false
    @State private var selectedRecipe = Recipe(name: "Empty", imageName: "Placeholder", ingredients: [Ingredient](), timeToCook: "30min", instructions: [String]())
    @State var quantityPromptHidden = false
    @State var toastShowing: Bool = false
    @State var toastMessage: String = ""
    @State var tabFilterSelection: Int = 0 // 0 = all, 1 = ready to cook, 2 = shopping list, 3 = other
    @State var cookingModeShowing: Bool = false
    
    
    var body: some View {
        ZStack{
            
            VStack{
                // MARK: Header
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Planned Meals")
                    .font(.title)
                    .onAppear {
                        userData.planNotificationCount = 0
                    }
                
                
                
                // MARK: Tab Filters
                ZStack{
                    ScrollView(.horizontal, showsIndicators: false){

                        HStack(){
                            Button(action: {
                                tabFilterSelection = 0
                            }) {
                                Text("All")
                                    .bold()
                                    .font(.system(size: CGFloat.defaultFontSize))
                                    .foregroundColor(.black)
                                    .padding(.leading, CGFloat.innerSectionPadding)
                                    .padding(.trailing, CGFloat.innerSectionPadding)
                                    .padding(.top, CGFloat.miniPadding)
                                    .padding(.bottom, CGFloat.miniPadding)
                            }
                            .background(Color.allMealsRed.opacity(0.5))
                            .cornerRadius(CGFloat.miniPadding)
                            .overlay {
                                if(tabFilterSelection == 0){
                                    
                                    RoundedRectangle(cornerRadius: CGFloat.miniPadding)
                                        .stroke(Color.allMealsRed, lineWidth: 2)
                                }
                            }
                            
                            
                            Button(action: {
                                tabFilterSelection = 1
                            }) {
                                Text("Ready to Cook")
                                    .bold()
                                    .font(.system(size: CGFloat.defaultFontSize))
                                    .foregroundColor(.black)
                                    .padding(.leading, CGFloat.innerSectionPadding)
                                    .padding(.trailing, CGFloat.innerSectionPadding)
                                    .padding(.top, CGFloat.miniPadding)
                                    .padding(.bottom, CGFloat.miniPadding)
                            }
                            .background(Color.primaryGreen.opacity(0.5))
                            .cornerRadius(CGFloat.miniPadding)
                            .overlay {
                                if(tabFilterSelection == 1){
                                    
                                    RoundedRectangle(cornerRadius: CGFloat.miniPadding)
                                        .stroke(Color.primaryGreen, lineWidth: 2)
                                }
                            }
                            
                            
                            Button(action: {
                                tabFilterSelection = 2
                            }) {
                                Text("Shopping List")
                                    .bold()
                                    .font(.system(size: CGFloat.defaultFontSize))
                                    .foregroundColor(.black)
                                    .padding(.leading, CGFloat.innerSectionPadding)
                                    .padding(.trailing, CGFloat.innerSectionPadding)
                                    .padding(.top, CGFloat.miniPadding)
                                    .padding(.bottom, CGFloat.miniPadding)
                            }
                            .background(Color.interactionYellow.opacity(0.5))
                            .cornerRadius(CGFloat.miniPadding)
                            .overlay {
                                if(tabFilterSelection == 2){
                                    
                                    RoundedRectangle(cornerRadius: CGFloat.miniPadding)
                                        .stroke(Color.interactionYellow, lineWidth: 2)
                                }
                            }
                            
                            
                            Button(action: {
                                tabFilterSelection = 3
                            }) {
                                Text("Other")
                                    .bold()
                                    .font(.system(size: CGFloat.defaultFontSize))
                                    .foregroundColor(.black)
                                    .padding(.leading, CGFloat.innerSectionPadding)
                                    .padding(.trailing, CGFloat.innerSectionPadding)
                                    .padding(.top, CGFloat.miniPadding)
                                    .padding(.bottom, CGFloat.miniPadding)
                            }
                            .background(Color.otherMealsBrown.opacity(0.5))
                            .cornerRadius(CGFloat.miniPadding)
                            .overlay {
                                if(tabFilterSelection == 3){
                                    RoundedRectangle(cornerRadius: CGFloat.miniPadding)
                                        .stroke(Color.otherMealsBrown, lineWidth: 2)
                                }
                            }
                        }
                        .padding(.leading, CGFloat.miniPadding)
                        .padding(.trailing, CGFloat.miniPadding)
                        .padding(.top, CGFloat.innerSectionPadding)
                        .padding(.bottom, CGFloat.halfPadding)
                    }
                }
                
                
                
                
                ScrollView{
                    VStack{
                        
                        // MARK: Quantity Prompt
                        if(!quantityPromptHidden){
                            
                            VStack{
                                HStack{
                                    Text("How many people do you cook for?")
                                        .font(.title2)
                                        .bold()
                                    Spacer()
                                    Image(systemName: "xmark")
                                        .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                                        .foregroundColor(.green)
                                        .onTapGesture {
                                            quantityPromptHidden = true
                                        }
                                }
                                .padding(.leading, CGFloat.innerSectionPadding)
                                .padding(.top, CGFloat.innerSectionPadding)
                                .padding(.trailing, CGFloat.innerSectionPadding)
                                
                                Text("This will become the default portion number for your shopping list. You can change it for individual recipes in the Shopping List tab.")
                                    .font(.system(size: CGFloat.defaultFontSize))
                                    .padding(.leading, CGFloat.innerSectionPadding)
                                    .padding(.top, CGFloat.innerSectionPadding)
                                    .padding(.trailing, CGFloat.innerSectionPadding)
                                
                                HStack{
                                    Spacer()
                                    
                                    Button(action: {
                                        if(userData.defaultPortionsNumber > 1){
                                            userData.defaultPortionsNumber -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus.circle.fill")
                                            .resizable()
                                            .frame(width: 25, height:25)
                                            .foregroundColor(Color.green)
                                    }
                                    
                                    Text("\(userData.defaultPortionsNumber)")
                                        .frame(width: 50)
                                    
                                    Button(action: {
                                        if(userData.defaultPortionsNumber < 20){
                                            userData.defaultPortionsNumber += 1
                                        }
                                    }) {
                                        Image(systemName: "plus.circle.fill")
                                            .resizable()
                                            .frame(width: 25, height:25)
                                            .foregroundColor(Color.green)
                                    }
                                    
                                    Spacer()
                                    
                                }
                                .padding(CGFloat.defaultPadding)
                            }
                            .background(Color.white)
                            .cornerRadius(CGFloat.smallCornerRadius)
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.top, CGFloat.halfPadding)
                            .shadow(radius: 5)
                        }
                        
                        
                        
                        
                        
                        
                       // MARK: All Recipes
                        if(tabFilterSelection == 0){
                            VStack{
                                ForEach(userData.plannedMeals){ recipe in
                                    PlanItemView(showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe, toastMessage: $toastMessage, toastShowing: $toastShowing, cookingModeShowing: $cookingModeShowing, tempPortionNumber: recipe.portionNumber, recipe: recipe)
                                }
                            }
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)

                            
                        // MARK: Ready to Cook Rcp
                        }else if(tabFilterSelection == 1){
                            VStack{
                                ForEach(userData.boughtMeals){ recipe in
                                    PlanItemView(showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe, toastMessage: $toastMessage, toastShowing: $toastShowing, cookingModeShowing: $cookingModeShowing, tempPortionNumber: recipe.portionNumber, recipe: recipe)
                                }
                            }
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)
                            
                            
                            
                        // MARK: Shopping List Rcp
                        }else if(tabFilterSelection == 2){
                            VStack{
                                ForEach(userData.notBoughtMeals){ recipe in
                                    if(recipe.ingredientsAdded){
                                        PlanItemView(showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe, toastMessage: $toastMessage, toastShowing: $toastShowing, cookingModeShowing: $cookingModeShowing, tempPortionNumber: recipe.portionNumber, recipe: recipe)
                                    }
                                }
                            }
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)
                            
                            
                        // MARK: Other Rcp
                        }else{
                            VStack{
                                ForEach(userData.notBoughtMeals){ recipe in
                                    if(!recipe.ingredientsAdded){
                                        PlanItemView(showRecipeModal: $showRecipeModal, selectedRecipe: $selectedRecipe, toastMessage: $toastMessage, toastShowing: $toastShowing, cookingModeShowing: $cookingModeShowing, tempPortionNumber: recipe.portionNumber, recipe: recipe)
                                    }
                                }
                            }
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)
                            
                        }
                    }
                }
            }

            if(cookingModeShowing){
                CookingModeView(cookingModeShowing: $cookingModeShowing)
            }
            ToastMessage(textMessage: $toastMessage, isShowing: $toastShowing)
            RecipeModal(isShowing: $showRecipeModal, recipe: $selectedRecipe, addBtnShowing: false)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

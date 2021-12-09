//
//  RecipeModal.swift
//  EcoShopper
//
//  Created by robert on 2021-11-02.
//

import SwiftUI
import Foundation

struct RecipeModal: View {
    @Binding var isShowing: Bool
    @Binding var recipe: Recipe
    @State var keywords: String = ""
    @State var recipeAdded = false
    @State var ingredientsSaved: Int = 0
    @EnvironmentObject var userData: UserData
    var addBtnShowing = true
    @State var cookingStage: Int = 0
    @State var cookingModeShowing: Bool = false
    
    var layout = [
        GridItem(.adaptive(minimum: 60))]
    
    var body: some View {
        
        ZStack(alignment: cookingStage != 2 ? .bottom : .center) {
            
            if(isShowing){
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                VStack(spacing: 0){
                    
                    
                    if(cookingStage == 0){
                        // MARK: Header Section
                        Group{
                            Image("Header")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            HStack{
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.green)
                                    .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                                    .onTapGesture {
                                        isShowing = false
                                    }
                                
                                Spacer()
                                
                                Text("\(recipe.nameId)")
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                Image(systemName: "heart")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.red)
                                    .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                                    .aspectRatio(contentMode: .fit)
                                    .onTapGesture {
                                        //...
                                    }
                            }
                            .padding(.bottom, CGFloat.halfPadding)
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                        }
                    }

                    
                    
                    
                    
                    
                    if(cookingStage == 0){
                        ScrollView{
                            VStack{
                                VStack{
                                    
                                    Image(recipe.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width)
//                                        .padding(.top, CGFloat.defaultPadding)
                                        .clipped()
                                }

                                
                                
                                // MARK: Title
                                Group{
                                    
                                    Button(action: {
                                        cookingModeShowing = true
                                    }) {
                                        Text("Cooking Mode")
                                            .foregroundColor(Color.black)
                                            .padding(.trailing, 10)
                                            .padding(.leading, 10)
                                    }
                                    .frame(width: 150, height: 40)
                                    .background(Color(red: 255/255, green: 192/255, blue: 79/255))
                                    .cornerRadius(20)
                                    .padding(CGFloat.defaultPadding)
                                }

                                
                                
                                
                                // MARK: Missing Ingredients
                                HStack{
                                    Text("Missing Ingredients")
                                        .font(.title3)
                                        .bold()
                                    Spacer()
                                }
                                .padding(.leading, CGFloat.defaultPadding)
                                .padding(.bottom, CGFloat.innerSectionPadding)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach (recipe.ingredients) { ingredient in
                                            if(userData.pantry.contains(where: { pantryIngr in
                                                return pantryIngr.nameId == ingredient.nameId
                                            })){
                                                
                                            }else{
                                                ZStack{
                                                    Image(ingredient.imageName)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 125, height: 125)
                                                        .cornerRadius(15)
                                                        .padding(.leading, 20)
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                
                                // MARK: Bought Ingredients
                                HStack{
                                    Text("Bought Ingredients")
                                        .font(.title3)
                                        .bold()
                                    Spacer()
                                }
                                .padding(.leading, CGFloat.defaultPadding)
                                .padding(.top, CGFloat.defaultPadding)
                                .padding(.bottom, CGFloat.innerSectionPadding)
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach (recipe.ingredients) { ingredient in
                                            if(userData.pantry.contains(where: { pantryIngr in
                                                return pantryIngr.nameId == ingredient.nameId
                                            })){
                                                ZStack{
                                                    Image(ingredient.imageName)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 125, height: 125)
                                                        .cornerRadius(15)
                                                        .padding(.leading, CGFloat.defaultPadding)
                                                }
                                            }else{

                                            }
                                        }
                                    }
                                }
                                
                                
                            
                                
                                
                                // MARK: Instructions
                                HStack{
                                    Text("Instructions")
                                        .font(.title3)
                                        .bold()
                                    Spacer()
                                }
                                .padding(.leading, CGFloat.defaultPadding)
                                
                                
                                ForEach(0..<recipe.instructions.count){ indx in
                                    VStack{
                                        HStack(alignment: .top){
                                            Text("\(indx)")
                                                .foregroundColor(Color.white)
                                                .background(
                                                    Image(systemName: "circle.fill")
                                                        .resizable()
                                                        .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                                                        .foregroundColor(.primaryGreen)
                                                        .padding(CGFloat.halfPadding)
                                                )
                                                .padding(.trailing, CGFloat.innerSectionPadding)
                                            Text(recipe.instructions[indx])
                                            Spacer()
                                        }
                                        
                                        Image("InstructionPlaceholder")
                                            .resizable()
                                            .scaledToFit()
                                            .opacity(0.5)
                                            
                                    }
                                    .padding(.leading, CGFloat.defaultPadding)
                                    .padding(.trailing, CGFloat.defaultPadding)
                                    .padding(.top, CGFloat.defaultPadding)
                                }
                            }
                        }
                        
                    }else if(cookingStage == 1){
                        UseUpView(cookingStage: $cookingStage, recipeCooked: $recipe, ingredientsSaved: $ingredientsSaved)
                    }else if(cookingStage == 2) {
                        AchievementModal(ingredientsUsedUp: $ingredientsSaved, cookingStage: $cookingStage)
                    }
                    
                    
                    
                    
                    
                }
                .frame(maxWidth: .infinity)
                .background(cookingStage != 2 ? Color.white : Color.white.opacity(0))
                .transition(.move(edge: .bottom))
            }
            
            
            // MARK: Buttons
            if(isShowing && cookingStage == 0){
                if(userData.plannedMeals.contains(where: { rcp in
                    return rcp.nameId == recipe.nameId
                })){
                    Button(action: {
                        cookingStage = 1
                    }) {
                        Text("I've cooked this")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                    }
                    .frame(height: 40)
                    .background(Color.interactionYellow)
                    .cornerRadius(20)
                    .padding()
                    
                }else{
                    Button(action: {
                        userData.planNotificationCount += 1
                        userData.addToMealPlan(newRecipe: recipe)
                    }) {
                        Text("Add to Planned Meals")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                    }
                    .frame(height: 40)
                    .background(Color.interactionYellow)
                    .cornerRadius(20)
                    .padding()
                }
            }

            if(cookingModeShowing){
                CookingModeView(cookingModeShowing: $cookingModeShowing)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .animation(.easeInOut)
    }
}

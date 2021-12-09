//
//  UseUpScreen.swift
//  EcoShopper
//
//  Created by robert on 2021-11-18.
//

import SwiftUI

struct UseUpView: View {
    @EnvironmentObject var userData: UserData
    @Binding var cookingStage: Int
    @Binding var recipeCooked: Recipe
    @Binding var ingredientsSaved: Int
    @State var selectedIngredients: [String] = [String]()
    
    var body: some View {
        ZStack (alignment: .top){
            VStack{
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                // MARK: Header
                VStack{
                    Text("Congratulations on your cooking efforts!")
                        .font(.title2)
                        .multilineTextAlignment(.center)

                    Text("Have you used up any of these?")
                        .bold()
                        .frame(maxWidth: 300)
                        .lineLimit(5)
                        .padding(.top, CGFloat.defaultPadding)
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.trailing, CGFloat.defaultPadding)
                
                
                VStack{
                    
                    // MARK: Ingredients List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach (userData.pantry) { ingredient in
                                
                                if(recipeCooked.ingredients.contains(where: { cookedIngr in
                                    return cookedIngr.nameId == ingredient.nameId
                                })){
                                    ZStack(alignment: .trailing){
                                        VStack{
                                            
                                            // MARK: Removable Item
                                            ZStack{
                                                Image(ingredient.imageName)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 75, height: 75)
                                                    .cornerRadius(CGFloat.smallCornerRadius)
                                                    .padding(0)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: CGFloat.smallCornerRadius)
                                                            .foregroundColor(selectedIngredients.contains(where: { ingrId in
                                                                return ingrId == ingredient.nameId
                                                            }) ? Color.white.opacity(0.5) : Color.white.opacity(0.0))
                                                    )
                                                
                                                VStack{
                                                    HStack{
                                                        Spacer()
                                                        Image(systemName: selectedIngredients.contains(where: { ingrId in
                                                            return ingrId == ingredient.nameId
                                                        }) ? "checkmark.circle.fill" : "checkmark.circle")
                                                            .resizable()
                                                            .frame(width: 25, height: 25)
                                                            .background(Color.white.opacity(1.0))
                                                            .clipShape(Circle())
                                                            .foregroundColor(.green)
                                                            .onTapGesture {
                                                                if(selectedIngredients.contains(where: { ingrId in
                                                                    return ingrId == ingredient.nameId
                                                                })){
                                                                    selectedIngredients.removeAll { ingrId in
                                                                        return ingrId == ingredient.nameId
                                                                    }
                                                                    ingredientsSaved -= 1
                                                                }else{
                                                                    selectedIngredients.append(ingredient.nameId)
                                                                    ingredientsSaved += 1
                                                                }
                                                            }
                                                    }
                                                    Spacer()
                                                }
                                                .frame(width: 75, height: 75)
                                            }
                                            .frame(width: 75, height: 75)
                                            
                                            
                                            
                                            // MARK: Item Label
                                            Text(ingredient.nameId)
                                                .font(.system(size: CGFloat.defaultFontSize))
                                                .lineLimit(3)
                                            
                                            Text(ingredient.amount > 1 ? "\(ingredient.amount) portions" : "\(ingredient.amount) portion")
                                                .font(.system(size: 12))
                                                .foregroundColor(.gray)
                                                .lineLimit(2)
                                        }
                                        .frame(width: 110)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding(.top, CGFloat.defaultPadding*2)
                
                Spacer()
                
                
                
                // MARK: Remove From Pantry Btn
                Button(action: {
                    while selectedIngredients.count > 0{
                        userData.pantry.removeAll { ingredient in
                            return ingredient.nameId == selectedIngredients[0]
                        }
                        selectedIngredients.remove(at: 0)
                    }
                    
                    userData.addSavedIngredients(howMany: ingredientsSaved)
                    
                    if(ingredientsSaved > 0){
                        cookingStage = 2
                    }else{
                        cookingStage = 0
                    }
                    
                }) {
                    Text("Done")
                        .foregroundColor(Color.black)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                .frame(width: 150, height: 40)
                .background(Color(red: 255/255, green: 192/255, blue: 79/255))
                .cornerRadius(20)
                .padding(.top, 20)

                Spacer()
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(.all)
        }
        .ignoresSafeArea()
    }
}

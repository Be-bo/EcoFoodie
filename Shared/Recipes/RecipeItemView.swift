//
//  RecipeItemView.swift
//  EcoShopper
//
//  Created by robert on 2021-11-22.
//

import SwiftUI

struct RecipeItemView: View {
    var recipeItem: Recipe
    @Binding var showRecipeModal: Bool
    @Binding var selectedRecipe: Recipe
    
    var body: some View {
        ZStack{
            VStack{
                Image(recipeItem.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: CGFloat.imageItemSizeDimen, height: CGFloat.imageItemSizeDimen)
                    .cornerRadius(CGFloat.smallCornerRadius)
                    .onTapGesture {
                        showRecipeModal = true
                        selectedRecipe = recipeItem
                    }
                
                Spacer()
                Text(recipeItem.nameId)
                    .font(.system(size: CGFloat.defaultFontSize))
                    .padding(.leading, CGFloat.miniPadding)
                    .padding(.trailing, CGFloat.miniPadding)
                Spacer()
            }
        }
        .frame(width: CGFloat.imageItemSizeDimen, height: 178)
        .background(Color.white)
        .cornerRadius(CGFloat.smallCornerRadius)
        .shadow(radius: 5)
        .padding(0)
        .padding(.leading, CGFloat.defaultPadding)
    }
}



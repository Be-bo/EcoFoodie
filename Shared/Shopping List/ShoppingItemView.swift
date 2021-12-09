//
//  ShoppingItemView.swift
//  EcoShopper
//
//  Created by robert on 2021-12-05.
//

import SwiftUI

struct ShoppingItemView: View {
    @EnvironmentObject var userData: UserData
    var ingredient: Ingredient
//    @State var 
    
    var body: some View {
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
                                .foregroundColor(userData.inCartIngredientIds.contains(where: { ingrId in
                                    return ingrId == ingredient.nameId
                                }) ? Color.white.opacity(0.7) : Color.white.opacity(0.0))
                        )
                        .onTapGesture {
                            if(userData.inCartIngredientIds.contains(where: { ingrId in
                                return ingrId == ingredient.nameId
                            })){
                                userData.removeFromCart(ingredient: ingredient)
                            }else{
                                userData.addToCart(ingredient: ingredient)
                            }
                        }
                    
                    if(userData.inCartIngredientIds.contains(where: { ingrId in
                        return ingrId == ingredient.nameId
                    })){
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: CGFloat.imageButtonSizeDimen, height: CGFloat.imageButtonSizeDimen)
                            .foregroundColor(.primaryGreen)
                    }
                }
                .frame(width: 75, height: 75)
                .background(Color.white)
                .cornerRadius(CGFloat.smallCornerRadius)
                .shadow(radius: CGFloat.defaultShadowRadius/2)
                
                
                
                // MARK: Item Label
                Text(ingredient.nameId)
                    .font(.system(size: 12))
                    .bold()
                    .lineLimit(3)
                
                Text("\(ingredient.amount * Int(ingredient.quantity)) \(ingredient.units)")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .frame(width: 110)
        }
    }
}

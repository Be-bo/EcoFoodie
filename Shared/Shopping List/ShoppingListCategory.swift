//
//  ShoppingListCategory.swift
//  EcoShopper
//
//  Created by robert on 2021-12-06.
//

import SwiftUI

struct ShoppingListCategory: View {
    @EnvironmentObject var userData: UserData
    var categoryName: String
    var layout = [GridItem(.adaptive(minimum: 75))]
    
    var body: some View {
        VStack{
            if(userData.shoppingList.contains(where: { ingr in
                return ingr.category == categoryName
            })){
                
                
                HStack{
                    Text(categoryName)
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                
                
                LazyVGrid(columns: layout, spacing: 0){
                    ForEach(userData.shoppingList){ ingredient in
                        if(ingredient.category == categoryName){
                            ShoppingItemView(ingredient: ingredient)
                                .padding(.leading, CGFloat.innerSectionPadding)
                                .padding(.bottom, CGFloat.innerSectionPadding)
                        }
                    }
                }
                .padding(.leading, CGFloat.miniPadding)
                .padding(.trailing, CGFloat.defaultPadding)
                .animation(.none)
            }
        }
    }
}

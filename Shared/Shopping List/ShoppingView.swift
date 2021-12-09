//
//  ShoppingView.swift
//  EcoShopper
//
//  Created by robert on 2021-11-04.
//

import SwiftUI

struct ShoppingView: View {
    @EnvironmentObject var userData: UserData
    var layout = [GridItem(.adaptive(minimum: 100))]
    @State var toastShowing: Bool = false
    @State var toastMessage: String = "Ingredient added to My Ingredients."
    
    var body: some View {
        ZStack{
            VStack{
                
                // MARK: Header
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack(alignment: .center){
                    Image(systemName: "plus") //cheating for symmetry...
                        .foregroundColor(.white)
                        .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                    
                    Spacer()
                    
                    Text("Shopping List")
                        .font(.title)
                        .onAppear {
                            userData.listNotificationCount = 0
                        }
                    
                    Spacer()
                    
                    
                    Button(action: {
                        // this button would add ingredients in the final app
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.primaryGreen)
                            .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                            .clipShape(Circle())
                    }
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.trailing, CGFloat.defaultPadding)
                
                
                
                
                // MARK: Ingredient Lists
                ZStack{
                    ScrollView{
                        VStack(spacing: 0){
                            
                            Group{
                                ShoppingListCategory(categoryName: "Produce")
                                ShoppingListCategory(categoryName: "Meat")
                                ShoppingListCategory(categoryName: "Dairy")
                                ShoppingListCategory(categoryName: "Bakery")
                                ShoppingListCategory(categoryName: "Condiments")
                            }
                            Group{
                                ShoppingListCategory(categoryName: "Seafood")
                                ShoppingListCategory(categoryName: "Canned Goods")
                                ShoppingListCategory(categoryName: "Dry Goods")
                                ShoppingListCategory(categoryName: "Beverages")
                            }
                            
                            // MARK: Checkout Button
                            if(userData.inCartIngredientIds.count>0){
                                Button(action: {
                                    userData.profileNotificationCount += userData.inCartIngredientIds.count
                                    userData.fillPantry()
                                    toastShowing = true
                                    toastMessage = "Items moved to My Ingredients."
                                }) {
                                    Text("Checkout")
                                        .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                                        .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                                        .font(.system(size: CGFloat.defaultFontSize))
                                        .foregroundColor(Color.black)
                                }
                                .frame(width: 150, height: 40)
                                .background(Color.interactionYellow)
                                .cornerRadius(CGFloat.largeCornerRadius)
                                .padding()
                            }
                            
                        }
                    }
                }
            }
            ToastMessage(textMessage: $toastMessage, isShowing: $toastShowing)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: View Model
class ShoppingViewModel: ObservableObject{
    
    
    init(){
        
    }
}

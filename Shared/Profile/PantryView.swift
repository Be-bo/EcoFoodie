//
//  PantryView.swift
//  EcoShopper
//
//  Created by robert on 2021-11-24.
//

import SwiftUI

struct PantryView: View {
    @EnvironmentObject var userData: UserData
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    
                    // MARK: Header
                    HStack(alignment: .center){
                        Button(action: {
                            isShowing = false
                        }) {
                            Image(systemName: "arrow.left")
                                .resizable()
                                .foregroundColor(.primaryGreen)
                                .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                                .background(Color.white.opacity(0.7))
                                .clipShape(Circle())
                        }
                        
                        Spacer()
                        
                        Text("My Ingredients")
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
                    .padding(CGFloat.defaultPadding)
                    
                    
                    // MARK: Categories
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            Text("All")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .underline(color: Color.primaryGreen)
                                .padding(.leading, CGFloat.miniPadding)
                            
                            Text("Fruits and Vegetables")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .padding(.leading, CGFloat.miniPadding)
                            
                            Text("Meat and Seafood")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .padding(.leading, CGFloat.miniPadding)
                            
                            Text("Condiments")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .padding(.leading, CGFloat.miniPadding)
                            
                            Text("Bakery")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .padding(.leading, CGFloat.miniPadding)
                            
                            Text("Dairy")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .bold()
                                .padding(.leading, CGFloat.miniPadding)
                        }
                    }
                    

                    
                    // MARK: List of Ingredients
                    VStack{
                        ForEach(userData.pantry){ ingredient in
                            HStack{
                                Image(ingredient.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(CGFloat.smallCornerRadius)
                                    .padding(.top, CGFloat.miniPadding)
                                    .padding(.bottom, CGFloat.miniPadding)
                                    .padding(.leading, CGFloat.miniPadding)
                                
                                VStack(alignment: .leading){
                                    Text(ingredient.nameId)
                                        .bold()
                                        .frame(height: CGFloat.smallButtonHeight)
                                        .font(.system(size: CGFloat.defaultFontSize))
                                    
                                    Text("Bought on")
                                        .font(.system(size: CGFloat.defaultFontSize))
                                    
                                    Text("Best before")
                                        .font(.system(size: CGFloat.defaultFontSize))
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing){
                                    Button(action: {
                                        userData.pantry.removeAll { ingr in
                                            return ingr.nameId == ingredient.nameId
                                        }
                                    }) {
                                        Text("Used All")
                                            .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                                            .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                                            .font(.system(size: CGFloat.defaultFontSize))
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(height: CGFloat.smallButtonHeight)
                                    .background(Color.interactionYellow)
                                    .cornerRadius(CGFloat.largeCornerRadius)
                                    
                                    
                                    Text(ingredient.dateBought, style: .date)
                                        .font(.system(size: CGFloat.defaultFontSize))
                                    
                                    Text(ingredient.bestBeforeDate, style: .date)
                                        .font(.system(size: CGFloat.defaultFontSize))
                                }
                                .padding(.trailing, 15)
                                

                                
                            }
                            .background(Color.white)
                            .cornerRadius(CGFloat.smallCornerRadius)
                            .shadow(radius: 5)
                            .padding(.bottom, CGFloat.innerSectionPadding)
                        }
                    }
                    .padding(.leading, CGFloat.defaultPadding)
                    .padding(.trailing, CGFloat.defaultPadding)
                    .padding(.top, CGFloat.defaultPadding)
                }
            }
        }
    }
}

//
//  CookingModeView.swift
//  EcoShopper
//
//  Created by robert on 2021-12-05.
//

import SwiftUI

struct CookingModeView: View {
    @Binding var cookingModeShowing: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            VStack{
                
                ZStack{
                    Image("InstructionPlaceholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .foregroundColor(Color.interactionYellow)
                }
                
                HStack{
                    Text("Step 1")
                        .padding(.leading, CGFloat.defaultPadding)
                        .padding(.top, CGFloat.defaultPadding)
                    
                    Spacer()
                }

                
                Text("Heat a pan. Add oil into the pan. Add butter, sliced onion, garlic, green pepper and Italian mixed herbs into it after the oil is hot.")
                    .font(.title)
                    .bold()
                    .padding(CGFloat.defaultPadding)

                
                
                
                Spacer()
                
                
                // MARK: Back | Timer | Next Btns
                HStack{
                    Button(action: {
                        //...
                    }) {
                        Text("Back")
                            .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                            .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                            .font(.system(size: CGFloat.defaultFontSize))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 88, height: 40)
                    .background(Color.darkGreen)
                    .cornerRadius(CGFloat.largeCornerRadius)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        //...
                    }) {
                        HStack{
                            Image(systemName: "timer")
                                .resizable()
                                .foregroundColor(Color.white)
                                .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)
                            
                            Text("3:00")
                                .font(.system(size: CGFloat.defaultFontSize))
                                .foregroundColor(Color.white)
                        }
                    }
                    .frame(width: 118, height: 40)
                    .background(Color.darkGreen)
                    .cornerRadius(CGFloat.largeCornerRadius)
                    
                    Spacer()
                    
                    
                    Button(action: {
                        //...
                    }) {
                        Text("Next")
                            .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                            .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                            .font(.system(size: CGFloat.defaultFontSize))
                            .foregroundColor(Color.white)
                    }
                    .frame(width: 88, height: 40)
                    .background(Color.darkGreen)
                    .cornerRadius(CGFloat.largeCornerRadius)
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.trailing, CGFloat.defaultPadding)
                .padding(.bottom, CGFloat.defaultPadding)
            }
            .background(Color.white)
            
            
            
            // MARK: Dismiss Button
            Button(action: {
                cookingModeShowing = false
            }) {
                Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: CGFloat.imageButtonIconSizeDimen, height: CGFloat.imageButtonIconSizeDimen)

            }
            .padding(.leading, CGFloat.defaultPadding)
            .padding(.top, 50)

            

        }
        .edgesIgnoringSafeArea(.top)
    }
}

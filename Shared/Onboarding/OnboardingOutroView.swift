//
//  OnboardingOutro.swift
//  EcoShopper
//
//  Created by robert on 2021-11-18.
//

import SwiftUI

struct OnboardingOutroView: View {
    @Binding var onboardingActive: Bool
    
    var body: some View {
        ZStack (alignment: .top){
            VStack{
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Image("AllSet")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(CGFloat.defaultPadding)
                
                Text("You are all set!")
                    .font(.title2)
                    .bold()
                    .padding(.leading, CGFloat.defaultPadding)
                    .padding(.trailing, CGFloat.defaultPadding)
                    .padding(.top, CGFloat.sectionPadding)
                
                Text("Start your food planning journey and prevent ingredients from going to waste!")
                    .foregroundColor(.gray)
                    .frame(maxWidth: 300)
                    .lineLimit(5)
                    .padding(.top, CGFloat.innerSectionPadding)
                
                
                
                Button(action: {
                    onboardingActive = false
                }) {
                    Text("Enter EcoFoodie")
                        .foregroundColor(Color.black)
                        .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                        .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                }
                .frame(height: CGFloat.largeButtonHeight)
                .background(Color.interactionYellow)
                .cornerRadius(CGFloat.largeButtonHeight/2)
                .padding(.top, CGFloat.defaultPadding)
                
                Spacer()
                
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(.all)
        }
        .ignoresSafeArea()

    }
}

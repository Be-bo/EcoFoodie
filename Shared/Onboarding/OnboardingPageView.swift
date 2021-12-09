//
//  OnboardingPage.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-17.
//

import SwiftUI

struct OnboardingPageView: View {
    
    let imageName: String
    let textTitle: String
    let textCaption: String
    let pageIndex: Int8
    @Binding var onboardingStage: Int8
    
    var body: some View {
        ZStack (alignment: .top){
            VStack{
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, CGFloat.defaultPadding)
                    .padding(.trailing, CGFloat.defaultPadding)
                    .padding(.top, CGFloat.sectionPadding)
                
                Text(textTitle)
                    .font(.title2)
                    .bold()
                    .padding(.leading, CGFloat.defaultPadding)
                    .padding(.trailing, CGFloat.defaultPadding)
                    .padding(.top, CGFloat.sectionPadding)
                
                Text(textCaption)
                    .padding(.leading, CGFloat.defaultPadding)
                    .padding(.trailing, CGFloat.defaultPadding)
                    .padding(.top, CGFloat.innerSectionPadding)
                
                if(pageIndex == 2){
                    Button(action: {
                        onboardingStage = 0
                    }) {
                        Text("Get Started")
                            .foregroundColor(Color.black)
                            .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                            .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                    }
                    .frame(width: 150, height: 40)
                    .background(Color.interactionYellow)
                    .cornerRadius(20)
                    .padding(CGFloat.defaultPadding)
                }
                
                Spacer()
                
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(.all)
        }
        .ignoresSafeArea()

    }
}

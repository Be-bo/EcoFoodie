//
//  OnboardingView.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-15.
//

import SwiftUI

struct OnboardingView: View {
    @State var onboardingStage: Int8 = -1
    @EnvironmentObject var userData: UserData
    @Binding var onboardingActive: Bool
    
    var body: some View {
        ZStack{
            if(onboardingStage == 0){
                AllergiesView(onboardingStage: $onboardingStage)
                    .ignoresSafeArea(.all)
            }
            else if(onboardingStage == 1){
                PreferencesView(onboardingStage: $onboardingStage)
                    .edgesIgnoringSafeArea(.top)
            }else if(onboardingStage == 2){
                OnboardingOutroView(onboardingActive: $onboardingActive)
                    .ignoresSafeArea(.all)
            }else{
                
                TabView{
                    SplashScreenView()

                    
                    OnboardingPageView(imageName: "MealPlan", textTitle: "Make smart meal plans", textCaption: "Avoid overpurchasing", pageIndex: 0, onboardingStage: $onboardingStage)
                    OnboardingPageView(imageName: "FoodStorage", textTitle: "Manage food storage", textCaption: "Use up your ingredients", pageIndex: 1, onboardingStage: $onboardingStage)
                    OnboardingPageView(imageName: "CookingSkills", textTitle: "Improve cooking skills", textCaption: "Stop food waste", pageIndex: 2, onboardingStage: $onboardingStage)
                }
                .tabViewStyle(.page(indexDisplayMode: .always ))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .edgesIgnoringSafeArea(.top)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .environmentObject(userData)
    }
}

//
//  ContentView.swift
//  Shared
//
//  Created by robert on 2021-10-28.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userData:UserData = UserData()
    @State var onboardingActive: Bool = true
    
    
    var body: some View {
        if(!onboardingActive){
            
            // MARK: Base App
            TabView{
                RecipeView()
                    .tabItem{
                        Image(systemName: "rectangle.stack.fill")
//                        Image("RecipeTab")
//                            .resizable()
//                            .frame(width: 25, height: 25, alignment: .center)
                        Text("Recipes")
                    }
                
                PlanView()
                    .tabItem{
                        Image(systemName: "calendar")
//                        Image("PlannedTab")
//                            .resizable()
//                            .frame(width: 25, height: 25, alignment: .center)
                        Text("My Plan")
                    }
                    .badge(userData.planNotificationCount)
                
                ShoppingView()
                    .tabItem{
                        Image(systemName: "list.bullet")
//                        Image("ListTab")
//                            .resizable()
//                            .frame(width: 25, height: 25, alignment: .center)
                        Text("Shopping")
                    }
                    .badge(userData.listNotificationCount)
                
                ProfileView()
                    .onTapGesture(perform: {
                        UserDefaults.standard.removeObject(forKey: "plannedMeals")
                        UserDefaults.standard.removeObject(forKey: "shoppingList")
                    })
                    .tabItem{
                        Image(systemName: "person.fill")
//                        Image("MeTab")
//                            .resizable()
//                            .frame(width: 25, height: 25, alignment: .center)
                        Text("Me")
                    }
                    .badge(userData.profileNotificationCount)
            }
            
            
            // MARK: Tab Bar Properties
            .accentColor(.green)
            .edgesIgnoringSafeArea(.top)
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.configureWithOpaqueBackground()
                if #available(iOS 15.0, *) {
                    UITabBar.appearance().scrollEdgeAppearance = appearance
                }
            }
            .environmentObject(userData)
        
        
            // MARK: Onboarding
        }else{
            OnboardingView(onboardingActive: $onboardingActive)
                .environmentObject(userData)
        }

    }
}

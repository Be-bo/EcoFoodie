//
//  ProfileView.swift
//  EcoShopper
//
//  Created by robert on 2021-11-04.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userData: UserData
    @State private var selection: String? = nil
    @State var pantryShowing: Bool = false
    
    var body: some View {
        ZStack{
            
            if(pantryShowing){
                PantryView(isShowing: $pantryShowing)
            }else{
                ScrollView{
                    VStack{
                        
                        // MARK: Header
                        Text("Me")
                            .font(.title)
                            .padding(.top,20)
                            .onAppear {
                                userData.profileNotificationCount = 0
                            }
                        
                        
                        
                        
                        // MARK: Profile Details
                        VStack{
                            HStack{
                                Image("ProfilePicture")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                
                                VStack(alignment: .leading){
                                    Text("Larry Dan Ballay")
                                    
                                    if(userData.totalAwards > 0){
                                        HStack{
                                            ForEach(0..<userData.totalAwards){ _ in
                                                Image("AwardGrey")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 30)
                                            }
                                        }
                                        .padding()
                                    }
                                    
                                    Button(action: {
                                    }) {
                                        Text("Edit Profile")
                                            .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                                            .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                                            .font(.system(size: CGFloat.defaultFontSize))
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(height: CGFloat.smallButtonHeight)
                                    .background(Color.interactionYellow)
                                    .cornerRadius(CGFloat.largeCornerRadius)
                                    
                                    Spacer()
                                }
                                .padding(.leading)
                                
                            }
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.top, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)
                            
                            
                            
                            
                            // MARK: Favorites & Cooked Btns
                            HStack{
                                Spacer()
                                
                                Button(action: {
                                }) {
                                    Text("Favorite Recipes")
                                        .font(.title3)
                                        .foregroundColor(Color.black)
                                        .padding(20)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: CGFloat.largeCornerRadius)
                                        .stroke(Color.green, lineWidth: 1)
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                }) {
                                    Text("Cooked Recipes")
                                        .font(.title3)
                                        .foregroundColor(Color.black)
                                        .padding(20)
                                }
                                .overlay {
                                    RoundedRectangle(cornerRadius: CGFloat.largeCornerRadius)
                                        .stroke(Color.green, lineWidth: 1)
                                }
                                
                                Spacer()
                            }
                            .padding(.top, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)
                            
                            
                            
                            
                            // MARK: Settings
                            VStack(alignment: .leading){
                                
                                Button(action: {
                                    pantryShowing = true
                                }) {
                                    Text("My Ingredients")
                                        .foregroundColor(Color.black)
                                        .font(.title3)
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.black)
                                    .padding(.top, CGFloat.defaultPadding)
                                    .padding(.bottom, CGFloat.defaultPadding)
                                
                                Button(action: {
                                }) {
                                    Text("Achievements")
                                        .foregroundColor(Color.black)
                                        .font(.title3)
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.black)
                                    .padding(.top, CGFloat.defaultPadding)
                                    .padding(.bottom, CGFloat.defaultPadding)
                                
                                Button(action: {
                                }) {
                                    Text("Preferences")
                                        .foregroundColor(Color.black)
                                        .font(.title3)
                                }
                                
                                Divider()
                                    .frame(height: 1)
                                    .background(Color.black)
                                    .padding(.top, CGFloat.defaultPadding)
                                    .padding(.bottom, CGFloat.defaultPadding)
                                
                                Button(action: {
                                }) {
                                    Text("Settings")
                                        .foregroundColor(Color.black)
                                        .font(.title3)
                                }
                            }
                            .padding(.leading, CGFloat.defaultPadding)
                            .padding(.trailing, CGFloat.defaultPadding)
                            .padding(.top, CGFloat.defaultPadding)
                            .padding(.bottom, CGFloat.defaultPadding)
                            
                            
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

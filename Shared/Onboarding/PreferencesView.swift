//
//  PreferencesView.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-15.
//

import SwiftUI

struct PreferencesView: View {
    @Binding var onboardingStage: Int8
    @EnvironmentObject var userData: UserData
    var layout = [GridItem(.adaptive(minimum: 75))]
    var staticDat: StaticData = StaticData()
    @State var selectedCategoryNames: [String] = [String]()
    
    var body: some View {
        ZStack{
            VStack{
                
                // MARK: Header
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack(){
                    Text("Tell us your preferences")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.top, CGFloat.defaultPadding)
                
                HStack(){
                    Text("Pick some recipe categories below.")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.top, CGFloat.innerSectionPadding)
                
                HStack(){
                    Text("You can always change these later.")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                
                
                
                // MARK: Preference Grid
                LazyVGrid(columns: layout, spacing: 10){
                    ForEach(staticDat.FoodCategories){ category in
                        
                        ZStack(alignment: .trailing){
                            VStack{
                                
                                // MARK: Removable Item
                                ZStack{
                                    
                                    Image(category.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 75, height: 75)
                                        .cornerRadius(15)
                                        .padding(0)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: CGFloat.smallCornerRadius)
                                                .foregroundColor(selectedCategoryNames.contains(category.nameId) ? Color.white.opacity(0.7) : Color.white.opacity(0.0))
                                        )
                                        .onTapGesture {
                                            if(selectedCategoryNames.contains(category.nameId)){
                                                selectedCategoryNames.remove(at: selectedCategoryNames.firstIndex(of: category.nameId)!)
                                            }else{
                                                selectedCategoryNames.append(category.nameId)
                                            }
                                        }
                                    
                                    if(selectedCategoryNames.contains(category.nameId)){
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
                                Text(category.nameId)
                                    .font(.system(size: 15))
                                    .lineLimit(3)
                            }
                            .frame(width: 110)
                        }
                    }
                }
                .animation(.none)
                .padding()
                
                
                
                // MARK: Footer
                Button(action: {
                    onboardingStage += 1
                }) {
                    Text("Done")
                        .foregroundColor(Color.black)
                        .padding(.trailing, 10)
                        .padding(.leading, 10)
                }
                .frame(width: 150, height: CGFloat.largeButtonHeight)
                .background(Color.interactionYellow)
                .cornerRadius(CGFloat.largeButtonHeight/2)
                .padding(.top, CGFloat.sectionPadding)
                
                
                Button(action: {
                    onboardingStage += 1
                }) {
                    Text("Skip for now")
                        .foregroundColor(Color.gray)
                        .underline()
                        .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                        .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                }
                .frame(height: CGFloat.largeButtonHeight)
                
                
                Spacer()
                    .frame(height: CGFloat.largeButtonHeight)
                
            }
            .edgesIgnoringSafeArea(.top)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

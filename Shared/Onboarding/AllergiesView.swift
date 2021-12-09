//
//  AllergiesView.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-15.
//

import SwiftUI

struct AllergiesView: View {
    @EnvironmentObject var userData: UserData
    var layout = [GridItem(.adaptive(minimum: 75))]
    @State var modalShowing:Bool = false
    @Binding var onboardingStage: Int8
    @ObservedObject var vm = AllergiesViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                
                Image("Header")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                // MARK: Header
                HStack(){
                    Text("Do you have any allergies?")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.top, CGFloat.defaultPadding)
                
                HStack(){
                    Text("Recipe suggestions will take this into account.")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                .padding(.top, CGFloat.innerSectionPadding)
                
                HStack(){
                    Text("You can always edit them in your profile.")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .padding(.leading, CGFloat.defaultPadding)
                
                
                
                // MARK: Allergy Grid
                LazyVGrid(columns: layout, spacing: 10){
                    ForEach(vm.selectedAllergies){ allergy in
                        
                        ZStack(alignment: .trailing){
                            VStack{
                                
                                // MARK: Plus Button Item
                                if(allergy.nameId == ""){
                                    Image(systemName: "plus.square.fill")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 75, height: 75)
                                        .padding(0)
                                        .foregroundColor(.gray)
                                        .onTapGesture {
                                            modalShowing = true
                                        }
                                }else{
                                    
                                    // MARK: Default Item
                                    ZStack{
                                        Image(allergy.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 75, height: 75)
                                            .padding(0)
                                            .background(Color.secondaryGreen)
                                            .cornerRadius(CGFloat.smallCornerRadius)
                                    }
                                    .frame(width: 75, height: 75)
                                }
                                
                                
                                
                                // MARK: Item Label
                                Text(allergy.nameId)
                                    .frame(height: 20)
                                    .font(.system(size: 15))
                                    .lineLimit(3)
                            }
                            .frame(width: 110)
                        }
                    }
                }
                .animation(.none)
                .padding(CGFloat.defaultPadding)
                
                Spacer()
                
                
                
                // MARK: Footer
                Button(action: {
                    onboardingStage = 1
                }) {
                    Text("Done")
                        .foregroundColor(Color.black)
                        .padding(.trailing, CGFloat.buttonTextHorizontalPadding)
                        .padding(.leading, CGFloat.buttonTextHorizontalPadding)
                }
                .frame(width: 150, height: CGFloat.largeButtonHeight)
                .background(Color.interactionYellow)
                .cornerRadius(CGFloat.largeButtonHeight/2)
                .padding(.top, CGFloat.defaultPadding)
                
                
                Button(action: {
                    onboardingStage = 1
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
            .background(Color.white)
            
            AllergyModal(isShowing: $modalShowing, selectedAllergies: $vm.selectedAllergies, availableAllergies: $vm.availableAllergies)
        }
    }
}


// MARK: View Model
class AllergiesViewModel: ObservableObject{
    @Published var selectedAllergies: [Allergy] = [Allergy(name: "", imageName: "Placeholder")]
    @Published var availableAllergies: [Allergy] = [Allergy]()
    var staticDat: StaticData = StaticData()
    
    init(){
        availableAllergies = staticDat.CommonAllergies
    }
}

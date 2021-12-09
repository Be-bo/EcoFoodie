//
//  AchievementPopUp.swift
//  EcoShopper
//
//  Created by robert on 2021-11-24.
//

import SwiftUI

struct AchievementModal: View {
    @EnvironmentObject var userData: UserData
    @Binding var ingredientsUsedUp: Int
    @Binding var cookingStage: Int
    let blackCapsuleWidth = (UIScreen.main.bounds.width/4 * 3) - (CGFloat.defaultPadding * 2) - 30
    let whiteCapsuleWidth = (UIScreen.main.bounds.width/4 * 3) - (CGFloat.defaultPadding * 2) - 33
    let greenCapsuleWidth: CGFloat = 100
    //TODO: logic
//    ((UIScreen.main.bounds.width/4 * 3) - (CGFloat.defaultHorizontalPadding * 2) - 36)
    
    var body: some View {
        ZStack{
            VStack{
                
                // MARK: Top
                Image("Achievement")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, CGFloat.defaultPadding)
            
                Spacer()
                
                HStack{
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: blackCapsuleWidth, height: 20)
                            .foregroundColor(Color.black)
                            .padding(.leading, 0)
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: whiteCapsuleWidth, height: 17)
                            .foregroundColor(Color.white)
                            .padding(.leading, 1.5)
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: greenCapsuleWidth, height: 14)
                            .foregroundColor(Color.primaryGreen)
                            .padding(.leading, 3)

                    }
                    Image("AwardGreen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                
                if(userData.totalIngredientsSaved % Int.awardIngredientAmount == 0 || ingredientsUsedUp > Int.awardIngredientAmount){
                    Text("Awesome job! You've received an award!")
                        .padding(.bottom, CGFloat.defaultPadding)
                }
                else if(ingredientsUsedUp == 1){
                    Text("Great job! You've used up \(ingredientsUsedUp) ingredient.")
                        .padding(.bottom, CGFloat.defaultPadding)
//                        .padding(.leading, CGFloat.defaultHorizontalPadding)
//                        .padding(.trailing, CGFloat.defaultHorizontalPadding)
                }else{
                    Text("Great job! You've used up \(ingredientsUsedUp) ingredients.")
                        .padding(.bottom, CGFloat.defaultPadding)
                }

             
                
                Spacer()
                
                
                // MARK: Buttons
                VStack{
                    Button(action: {
                        // TODO
                    }) {
                        Text("Check Achievements")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                    }
                    .frame(width: 200, height: 40)
                    .background(Color.interactionYellow)
                    .cornerRadius(20)
                    
                    Button(action: {
                        cookingStage = 0
                    }) {
                        Text("Done")
                            .foregroundColor(Color.black)
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                    }
                    .frame(width: 200, height: 40)
                    .background(Color.interactionYellow)
                    .cornerRadius(20)
                }
                .padding(.bottom, CGFloat.defaultPadding)

                
                
                
            }
            .frame(width: UIScreen.main.bounds.width/4 * 3, height: UIScreen.main.bounds.width)
            .background(
                ZStack{
                    // Hack for rounded corners
                    RoundedRectangle(cornerRadius: CGFloat.largeCornerRadius)
                }
                    .foregroundColor(.white)
            )
        }
    }
}

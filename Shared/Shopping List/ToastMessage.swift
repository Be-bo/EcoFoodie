//
//  ToastMessage.swift
//  EcoShopper
//
//  Created by robert on 2021-11-18.
//

import SwiftUI

struct ToastMessage: View{
    @Binding var textMessage: String
    @Binding var isShowing: Bool
    
    var body: some View {
        if(isShowing){
            VStack{
                Spacer()
                HStack{
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .padding()
                    
                    Text(textMessage)
                        .padding(.trailing)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.green, lineWidth: 2)
                )
                .background(Color.green)
                .cornerRadius(15)
                .padding()
            }
            .onTapGesture {
                isShowing = false
            }
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) { //hide this pop up after 5 seconds
                                self.isShowing = false
                            }
            }
        }
    }
}

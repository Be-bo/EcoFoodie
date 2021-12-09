//
//  SplashScreen.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-15.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Image("SplashScreen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .clipped()
        }
        .ignoresSafeArea(.all)
    }
}

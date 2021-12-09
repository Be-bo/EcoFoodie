//
//  AllergyModal.swift
//  EcoShopper (iOS)
//
//  Created by robert on 2021-11-15.
//

import SwiftUI

struct AllergyModal: View {
    @Binding var isShowing: Bool
    @State private var isDragging = false
    @State private var curHeight: CGFloat = 500
    @State var searchText: String = ""
    @State private var isEditing = false
    @Binding var selectedAllergies:[Allergy]
    @Binding var availableAllergies: [Allergy]
    let minHeight: CGFloat = 500
    let maxHeight: CGFloat = UIScreen.main.bounds.size.height - 200
    var layout = [GridItem(.adaptive(minimum: 75))]
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            if(isShowing){
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                mainView
                    .transition(.move(edge: .bottom))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut)
    }
    
    
    
    // MARK: Main View
    var mainView: some View{
        VStack{
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.00001))
            .gesture(dragGesture)
            
            
            
            // MARK: Search Bar
            HStack{
                TextField("Search ...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                     
                            if isEditing {
                                Button(action: {
                                    self.searchText = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                        
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
            

            
            
            // MARK: Common Allergies List
            Text("Common Allergies")
                .bold()
                .padding(.top)
            LazyVGrid(columns: layout, spacing: 10){
                ForEach(availableAllergies){ allergy in
                    
                    ZStack(alignment: .trailing){
                        VStack{
                            
                            Image(allergy.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 75, height: 75)
                                .padding(0)
                                .background(selectedAllergies.contains(where: { alrg in
                                    return alrg.nameId == allergy.nameId
                                }) ? Color.secondaryGreen : Color.white)
                                .cornerRadius(CGFloat.smallCornerRadius)
                                .onTapGesture {
                                    if(selectedAllergies.contains(where: { alrg in
                                        return alrg.nameId == allergy.nameId
                                    })){
                                        selectedAllergies.removeAll(where: { alrg in
                                            return alrg.nameId == allergy.nameId
                                        })
                                    }else{
                                        selectedAllergies.append(allergy)
                                    }
                                }
                            
                            
                            Text(allergy.nameId)
                                .font(.system(size: 15))
                                .lineLimit(3)
                        }
                        .frame(width: 110)
                    }
                }
            }
            .animation(.none)
            .padding(.top)
            
            Spacer()
            
            
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                // Hack for rounded corners
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight/2)
            }
                .foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45))
    }
    
    
    
    // MARK: Drag Gesture
    @State private var prevDragTranslation = CGSize.zero
    var dragGesture: some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { val in
                if !isDragging{
                    isDragging = true
                }
                let dragAmount = val.translation.height - prevDragTranslation.height
                if curHeight > maxHeight || curHeight < minHeight{
                    curHeight -= dragAmount/6
                }else{
                    curHeight -= dragAmount
                }
                prevDragTranslation = val.translation
            }
            .onEnded { val in
                prevDragTranslation = .zero
                isDragging = false
                if curHeight>maxHeight{
                    curHeight = maxHeight
                }else if curHeight < minHeight{
                    curHeight = minHeight
                }
            }
    }
}

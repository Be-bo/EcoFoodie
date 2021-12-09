//
//  Extensions.swift
//  EcoShopper
//
//  Created by robert on 2021-11-22.
//

import SwiftUI

extension Color {
    public static var interactionYellow: Color {
        return Color(UIColor(red: 255/255, green: 192/255, blue: 79/255, alpha: 1.0))
    }
    
    public static var darkGreen: Color{
        return Color(UIColor(red: 89/255, green: 161/255, blue: 97/255, alpha: 1.0))
    }
    
    public static var primaryGreen: Color{
        return Color(UIColor(red: 114/255, green: 199/255, blue: 123/255, alpha: 1.0))
    }
    
    public static var secondaryGreen: Color{
        return Color(UIColor(red: 132/255, green: 223/255, blue: 142/255, alpha: 1.0))
    }
    
    public static var lightGreen: Color{
        return Color(UIColor(red: 221/255, green: 250/255, blue: 219/255, alpha: 1.0))
    }
    
    public static var shoppingListYellow: Color{
        return Color(UIColor(red: 252/255, green: 190/255, blue: 80/255, alpha: 1.0))
    }
    
    public static var otherMealsBrown: Color{
        return Color(UIColor(red: 213/255, green: 170/255, blue: 146/255, alpha: 1.0))
    }
    
    public static var allMealsRed: Color{
        return Color(UIColor(red: 241/255, green: 106/255, blue: 109/255, alpha: 1.0))
    }
}

extension CGFloat{
    
    public static var defaultPadding: CGFloat{
        return 24
    }
    
    public static var innerSectionPadding: CGFloat{
        return 16
    }
    
    public static var sectionPadding: CGFloat{
        return 32
    }
    
    public static var miniPadding: CGFloat{
        return 8
    }
    
    public static var halfPadding: CGFloat{
        return 12
    }
    
    public static var imageItemSizeDimen: CGFloat{
        return 120
    }
    
    public static var imageButtonSizeDimen: CGFloat{
        return 28
    }
    
    public static var imageButtonIconSizeDimen: CGFloat{
        return 20
    }
    
    public static var planItemBorderWidth: CGFloat{
        return 4
    }
    
    
    public static var defaultShadowRadius: CGFloat{
        return 5
    }
    
    public static var smallCornerRadius: CGFloat{
        return 15
    }
    
    public static var largeCornerRadius: CGFloat{
        return 20
    }
    
    public static var defaultFontSize: CGFloat{
        return 15
    }
    
    public static var buttonTextHorizontalPadding: CGFloat{
        return 15
    }
    
    public static var defaultBottomOffset: CGFloat{
        return 40
    }
    
    public static var largeButtonHeight: CGFloat{
        return 40
    }
    
    public static var smallButtonHeight: CGFloat{
        return 30
    }
    
}

extension Int{
    public static var awardIngredientAmount: Int{
        return 10
    }
}

extension Font{
    static func sfPro(size: CGFloat) -> Font {
      return .custom("SF-Compact", size: size)
    }
}


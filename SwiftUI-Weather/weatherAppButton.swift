//
//  weatherAppButton.swift
//  SwiftUI-Weather
//
//  Created by Ahmad Amjad on 25/06/2024.
//

import Foundation
import SwiftUI

struct buttonText: View {
    
    var title: String
    var background: Color
    var foreground: Color
    
    var body: some View {
        Text(title)
            .font(.system(size: 20))
            .frame(width: 250,height: 40)
            .background(background)
            .foregroundColor(foreground)
            .cornerRadius(10)
    }
}

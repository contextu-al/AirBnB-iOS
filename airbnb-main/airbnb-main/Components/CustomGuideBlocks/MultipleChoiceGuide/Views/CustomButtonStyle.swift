//
//  CustomButtonStyle.swift
//  ContextualSDK
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    let bgColor : Color
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label            
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            .frame(minWidth: 104, minHeight: 40)
            
            .background(bgColor)
            .cornerRadius(20.0)
            .foregroundColor(Color.white)
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut(duration: 0.2))
    }
}

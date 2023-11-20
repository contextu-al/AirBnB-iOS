//
//  FancyAnnouncementGuideView.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 7/11/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI

struct FancyAnnouncementGuideView: View {
    var title: String
    var message: String
    var buttonText: String
    var buttonTapped: () -> ()

    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .frame(width: 300, height: 200)
                    .foregroundColor(.white)
                    .overlay(
                        VStack {
                            Text(self.title)
                                .font(.title)
                                .bold()
                            Text(self.message)
                                .font(.body)
                                .padding(.top, 10)
                        }
                    )
                    .zIndex(1)
                Button(action: {
                    self.buttonTapped()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.red)
                }
                .background(Color.white)
                .cornerRadius(20)
                .offset(x: 150, y: -220)
                .zIndex(2)
            }
        }
    }
}

struct FancyAnnouncementGuideView_Previews: PreviewProvider {
    static var previews: some View {
        FancyAnnouncementGuideView(title: "Title", message: "Message", buttonText: "Done") {
            // Do nothing
        }
    }
}

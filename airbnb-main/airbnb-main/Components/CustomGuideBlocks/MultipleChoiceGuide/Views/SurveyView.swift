//
//  SurveyView.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import Combine
import SwiftUI

struct SurveyView: View {
    
    var title: String
    @ObservedObject var question: MultipleChoiceQuestionModel
    var cancelTapped: () -> Void
    var doneTapped: () -> Void
    
    var body: some View {
        VStack(spacing:0) {
            Text(self.title)
                .bold()
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 2, trailing: 0))
                .frame(maxWidth: .infinity)
            ScrollView {
                MultipleChoiceQuestionView(question: question)
            }
            .background(Color.white)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color(.systemGray4)), alignment: .top)
        }
        HStack() {
            Button(action: { cancelTapped() }, label: {
                Text("Cancel").foregroundColor(Color(.secondaryLabel)).bold()
            }).buttonStyle(CustomButtonStyle(bgColor: Color(.systemGray5)))
            Spacer()
            Button(action: { doneTapped() }, label: {
                Text("Done").bold()
            }).buttonStyle(CustomButtonStyle(bgColor: Color.blue))
        }
        .padding(EdgeInsets(top: 12, leading: 22, bottom: 18, trailing: 22))
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea( [.leading, .trailing] )
    }
}

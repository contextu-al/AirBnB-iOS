//
//  MultipleChoiceQuestionView.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI

struct MultipleChoiceQuestionView : View {
    
    @ObservedObject var question : MultipleChoiceQuestionModel

    @State var selectedIndices : Set<Int> = []
    @State private var customTextEntry: String = ""
    
    var body: some View {
        VStack {
            Text(question.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top:14, leading: 16, bottom: 8, trailing: 16))
            
            if question.allowsMultipleSelection {
                Text("Pick as many as you want")
                    .italic()
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            ForEach(question.choices, id: \.uuid) { choice in
                
                MultipleChoiceResponseView(question: question,
                                           choice: choice,
                                           selectedIndices: $selectedIndices)
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
    
    func selectChoice(_ selectedChoice : MultipleChoiceResponseModel) {
        if question.allowsMultipleSelection {
            for (i,choice) in question.choices.enumerated() {
                if selectedChoice.uuid == choice.uuid {
                    if selectedIndices.contains(i) {
                        selectedIndices.remove(i)
                        question.choices[i].selected = false;
                        selectedChoice.selected = false;
                    } else {
                        selectedIndices.insert(i)
                        question.choices[i].selected = true;
                        selectedChoice.selected = true;
                    }
                }
            }
        } else {
            selectedIndices = []
            for (i,choice) in question.choices.enumerated() {
                if selectedChoice.uuid == choice.uuid {
                    choice.selected = true;
                    selectedIndices = [i]
                } else {
                    choice.selected = false;
                }
            }
        }
    }
    
    func updateCustomText(_ selectedChoice : MultipleChoiceResponseModel, _ text : String) {
        for (i,choice) in question.choices.enumerated() {
            if selectedChoice.uuid == choice.uuid {
                question.choices[i].customTextEntry = text
                selectedChoice.customTextEntry = text
            }
        }
    }
}

//
//  MultipleChoiceResponseView.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import Combine
import SwiftUI

struct MultipleChoiceResponseView : View {
    
    @ObservedObject var question : MultipleChoiceQuestionModel
    @ObservedObject var choice : MultipleChoiceResponseModel
    
    @Binding public var selectedIndices : Set<Int>
    
    @State private var customTextEntry: String = ""
    
    static let OtherTextFieldID : Int = 8919
    
    var body : some View {
        VStack {
            Button(action: { selectChoice(choice) }, label: {
                
                Circle().fill(choice.selected ? Color.green : Color(.systemGray5)).frame(width: 30, height: 30, alignment: .center).padding(EdgeInsets.init(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .overlay(
                        choice.selected ?
                            Image(systemName: "checkmark").foregroundColor(.white)
                            .padding(EdgeInsets(top:0, leading: 20, bottom: 0, trailing: 0)): nil
                    )
                Text( choice.text )
                    .fontWeight( choice.selected ? .bold : .regular )
                    .foregroundColor( Color(.label ) )
                    .padding()
                Spacer()
            })
            .cornerRadius(selectedIndices.count == 0 ? 28 : 28)
            .overlay(RoundedRectangle(cornerRadius: 28)
                        .stroke( choice.selected ? Color.green : Color(.systemGray5), lineWidth: 2) )
            .background(RoundedRectangle(cornerRadius: 28).fill(Color.white))
            .padding(EdgeInsets.init(top: 3, leading: 35, bottom: 3, trailing: 35))
            
            if choice.allowsCustomTextEntry && choice.selected {
                HStack {
                    TextFieldWithDone(placeHolder:"Tap to Edit!", text: $customTextEntry, keyType: .default)
                        .onReceive(Just(customTextEntry)) { text in
                            self.updateCustomText(choice, text)
                        }
                        .padding(EdgeInsets(top: 16, leading: 10, bottom: 3, trailing: 10))
                        .foregroundColor(Color(.systemGray2))
                        .id(Self.OtherTextFieldID)
                        .onAppear(perform: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if let text = choice.customTextEntry {
                                    self.customTextEntry = text
                                }
                            }
                        })
                    
                }
                .background(
                    RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 14, extraHeight: 22)
                        .fill(Color(.systemGray6), strokeBorder: Color(.systemGray2), lineWidth: 2)
                        .offset(y:-14)
                )
                .padding(EdgeInsets.init(top: 5, leading: 35, bottom: 12, trailing: 35))
                .offset(y: -24.0)
                .zIndex(-1)
            }
        }
    }
    
    func selectChoice( _ selectedChoice : MultipleChoiceResponseModel ) {
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
    
    func updateCustomText( _ selectedChoice : MultipleChoiceResponseModel, _ text : String ) {
        for (i,choice) in question.choices.enumerated() {
            if selectedChoice.uuid == choice.uuid {
                question.choices[i].customTextEntry = text
                selectedChoice.customTextEntry = text
            }
        }
    }
}

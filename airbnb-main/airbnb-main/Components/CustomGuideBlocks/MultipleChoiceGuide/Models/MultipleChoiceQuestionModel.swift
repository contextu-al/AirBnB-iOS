//
//  MultipleChoiceQuestionModel.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import Foundation

class MultipleChoiceQuestionModel : ObservableObject, ISurveyQuestion {

    let title : String
    let uuid: UUID
    var choices : [MultipleChoiceResponseModel]
    var required: Bool = false
    var allowsMultipleSelection = false
    var tag: String
    var type: SurveyItemType = .multipleChoiceQuestion
    
    init(title:String, answers:[String], multiSelect : Bool = false, tag : String ) {
        self.title = title
        self.uuid = UUID()
        self.choices = answers.map({ MultipleChoiceResponseModel($0) })
        self.allowsMultipleSelection = multiSelect
        self.tag = tag
    }
    
    init(title:String, items: [Any], multiSelect : Bool = false, tag : String ) {
        self.title = title
        self.uuid = UUID()
        
        self.choices = []
        
        for item in items {
            if let item2 = item as? String {
                self.choices.append( MultipleChoiceResponseModel(item2) )
            } else if let item2 = item as? MultipleChoiceResponseModel {
                self.choices.append( item2 )
            }
        }
        self.allowsMultipleSelection = multiSelect
        self.tag = tag
    }
    
}

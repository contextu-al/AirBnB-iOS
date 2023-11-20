//
//  ISurveyQuestion.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import Foundation

protocol ISurveyQuestion : Codable {
    var title : String { get }
    var uuid : UUID { get }
    var tag : String { get }
    
    var type : SurveyItemType { get }
    var required : Bool { get set }
}

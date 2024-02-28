//
//  QuizGuideController.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/27.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let quizGuideController = QuizGuideController()

class QuizGuideController {
    var quizGuide = QuizGuide()
    
    init() {
        quizGuide.completedCallback = {
            print("QuizGuideController, quizGuide.completedCallback")
        }
        quizGuide.closeButtonTapped = {
            print("QuizGuideController, quizGuide.completedCallback")
        }
    }
}

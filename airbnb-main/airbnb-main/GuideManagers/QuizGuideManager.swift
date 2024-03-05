//
//  QuizGuideManager.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/27.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let quizGuideManager = QuizGuideManager()

class QuizGuideManager {
    var guideController = QuizGuideController()
    
    init() {
        guideController.completedCallback = {
            print("QuizGuideManager, guideController.completedCallback")
        }
        guideController.closeButtonTapped = {
            print("QuizGuideManager, guideController.completedCallback")
        }
    }
}

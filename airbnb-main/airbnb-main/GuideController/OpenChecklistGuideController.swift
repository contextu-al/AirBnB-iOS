//
//  OpenChecklistGuideController.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/21.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let openChecklistGuideController = OpenChecklistGuideController()

class OpenChecklistGuideController {
    var openChecklistGuide = OpenChecklistGuide()
    
    init() {
        openChecklistGuide.tasksCompletedCallback = {
            print("OpenChecklistGuideController, openChecklistGuide.tasksCompletedCallback")
        }
    }
}

//
//  OpenChecklistGuideManager.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/21.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let openChecklistGuideManager = OpenChecklistGuideManager()

class OpenChecklistGuideManager {
    var guideController = ChecklistGuideController()
    
    init() {
        guideController.completedCallback = {
            print("OpenChecklistGuideManager, guideController.completedCallback")
        }
        guideController.closeButtonTapped = {
            print("OpenChecklistGuideManager, guideController.closeButtonTapped")
        }
    }
}

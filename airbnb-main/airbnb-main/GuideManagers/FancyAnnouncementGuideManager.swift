//
//  FancyAnnouncementGuideManager.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/22.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let fancyAnnouncementGuideManager = FancyAnnouncementGuideManager()

class FancyAnnouncementGuideManager {
    var guideController = FancyAnnouncementGuideController()
    
    init() {
        guideController.leftButtonTapped = {
            print("FancyAnnouncementGuideManager, guideController.leftButtonTapped")
        }
        guideController.rightButtonTapped = {
            print("FancyAnnouncementGuideManager, guideController.rightButtonTapped")
        }
        guideController.closeButtonTapped = {
            print("FancyAnnouncementGuideManager, guideController.closeButtonTapped")
        }
    }
}

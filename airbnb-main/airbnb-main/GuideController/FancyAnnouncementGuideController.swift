//
//  FancyAnnouncementGuideController.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/22.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let fancyAnnouncementGuideController = FancyAnnouncementGuideController()

class FancyAnnouncementGuideController {
    var fancyAnnouncementGuide = FancyAnnouncementGuide()
    
    init() {
        fancyAnnouncementGuide.leftButtonTapped = {
            print("FancyAnnouncementGuideController, fancyAnnouncementGuide.leftButtonTapped")
        }
        fancyAnnouncementGuide.rightButtonTapped = {
            print("FancyAnnouncementGuideController, fancyAnnouncementGuide.rightButtonTapped")
        }
        fancyAnnouncementGuide.closeButtonTapped = {
            print("FancyAnnouncementGuideController, fancyAnnouncementGuide.closeButtonTapped")
        }
    }
}

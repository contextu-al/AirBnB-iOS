//
//  CircleVideoGuideManager.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/22.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let circleVideoGuideManager = CircleVideoGuideManager()

class CircleVideoGuideManager {
    var guideController = CircleVideoGuideController()
    
    init() {
        guideController.videoIsPlaying = {
            print("CircleVideoGuideWrapper, guideController.videoIsPlaying")
        }
        guideController.closeButtonTapped = {
            print("CircleVideoGuideWrapper, guideController.closeButtonTapped")
        }
    }
}

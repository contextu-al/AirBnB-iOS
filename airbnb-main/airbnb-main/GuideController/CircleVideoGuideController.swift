//
//  CircleVideoGuideController.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/22.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let circleVideoGuideController = CircleVideoGuideController()

class CircleVideoGuideController {
    var circleVideoGuide = CircleVideoGuide()
    
    init() {
        circleVideoGuide.videoIsPlaying = {
            print("CircleVideoGuideController, circleVideoGuide.videoIsPlaying")
        }
    }
}

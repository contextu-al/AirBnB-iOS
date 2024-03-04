//
//  QRCodeGuideManager.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/20.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let qrCodeGuideManager = QRCodeGuideManager()

class QRCodeGuideManager {
    var guideController = QRCodeGuideController()
    
    init() {
        guideController.scannedCodeCallback = { code in
            print("QRCodeGuideController, scannedCodeCallback, code: \(code)")
        }
        guideController.closeButtonTapped = {
            print("QRCodeGuideController, qrCodeGuide.closeButtonTapped")
        }
    }
}

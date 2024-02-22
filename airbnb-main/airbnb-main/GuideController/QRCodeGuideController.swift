//
//  QRCodeGuideController.swift
//  GuideBlocks
//
//  Created by Amr Aboelela on 2024/2/20.
//  Copyright © 2024 Contextual.
//

import GuideBlocks

let qrCodeGuideController = QRCodeGuideController()

class QRCodeGuideController {
    var qrCodeGuide = QRCodeGuide()
    
    init() {
        qrCodeGuide.scannedCodeCallback = { code in
            print("QRCodeGuideController, scannedCodeCallback, code: \(code)")
        }
    }
}

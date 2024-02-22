//
//  AppFieldEditGuide.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 2023/11/10.
//  Copyright © 2023 Contextual.
//

import SwiftUI
import ContextualSDK

public class AppFieldEditGuide: CTXBaseGuideController {
    
    public static let sharedInstance = AppFieldEditGuide()
    
    public var hasInteractedWithFilter = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.nextStepOfGuide()
            }
            
        }
    }
    
    public override func presentGuideBlock(contextualContainer: ContextualContainer,
                                           viewController controller: UIViewController?,
                                           success: @escaping ((CTXIGuidePayload) -> ()),
                                           failure: @escaping ((CTXIGuidePayload) -> ())) {

        guard let controller = controller else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        // Once the user has interacted with the required field, then we can progress the guide
        
    }
    
    override public func isDismissingGuide() {
        // Do nothing
    }
}

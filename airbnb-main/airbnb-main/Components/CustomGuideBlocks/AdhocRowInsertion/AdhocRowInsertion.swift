//
//  AdhocRowInsertion.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 7/11/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import Foundation
import ContextualSDK

public class AdhocRowInsertion: CTXBaseGuideController {
    
    public override func presentGuideBlock(contextualContainer: ContextualContainer,
                                           viewController controller: UIViewController?,
                                           success: @escaping ((CTXIGuidePayload) -> ()),
                                           failure: @escaping ((CTXIGuidePayload) -> ())) {
        let guide = contextualContainer.guidePayload.guide
        
        guard let position = guide.extraJson?["position"] as? Int else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        guard let cellID = guide.extraJson?["cellID"] as? String else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        guard let name = guide.extraJson?["name"] as? String else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        guard let image = guide.arrayImages?.first else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        guard let feedController = controller as? AirbnbExploreFeedController else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        let rowHeight: Double = guide.extraJson?["rowHeight"] as? Double ?? 300
        let category = AirbnbCategoryModel(name: name, cellID: cellID, rowHeight: rowHeight, imageUrl: image.resource)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            feedController.addCategory(category, atIndex: position)
            success(contextualContainer.guidePayload)
        })
    }
    
    override public func isDismissingGuide() {
        // Do nothing
    }
}

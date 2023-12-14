//
//  FancyAnnouncementGuide.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 7/11/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI
import ContextualSDK

public class FancyAnnouncementGuide: CTXBaseGuideController {
    
    private var hostingController: UIHostingController<FancyAnnouncementGuideView>?
    
    public override func presentGuideBlock(contextualContainer: ContextualContainer,
                                           viewController controller: UIViewController?,
                                           success: @escaping ((CTXIGuidePayload) -> ()),
                                           failure: @escaping ((CTXIGuidePayload) -> ())) {
        let guide = contextualContainer.guidePayload.guide
        
        guard let controller = controller else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        guard let title = guide.title.text else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        guard let message = guide.content.text else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        let view = FancyAnnouncementGuideView(title: title, message: message, buttonTapped: {
            self.hostingController?.willMove(toParent: nil)
            self.hostingController?.view.removeFromSuperview()
            self.hostingController?.removeFromParentViewController()
            self.dismissGuide()
        })
        
        self.hostingController = UIHostingController(rootView: view)
        
        guard let hostingController = self.hostingController else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        controller.addChildViewController(self.hostingController!)
        controller.view.addSubview(self.hostingController!.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor)
        ])
        
        hostingController.didMove(toParent: controller)

        success(contextualContainer.guidePayload)
    }
    
    override public func isDismissingGuide() {
        self.hostingController?.willMove(toParent: nil)
        self.hostingController?.view.removeFromSuperview()
        self.hostingController?.removeFromParentViewController()
    }
}

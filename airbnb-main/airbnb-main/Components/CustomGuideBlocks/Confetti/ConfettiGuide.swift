//
//  ConfettiGuide.swift
//  airbnb-main
//
//  Created by Marc Stroebel on 8/12/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI
import ContextualSDK

public class ConfettiGuide: CTXBaseGuideController {
    
    private var hostingController: UIHostingController<ConfettiView>?
    
    public override func presentGuideBlock(contextualContainer: ContextualContainer,
                                           viewController controller: UIViewController?,
                                           success: @escaping ((CTXIGuidePayload) -> ()),
                                           failure: @escaping ((CTXIGuidePayload) -> ())) {

        guard let controller = controller else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        let view = ConfettiView()
        
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Dismissing the guide after 5 seconds since it is a timed guide requiring no user intervention
            // If we don't dismiss the guide here, we would see a message in the console if we tried to use the same
            // guide again on a different page without this one being dismissed
            self.dismissGuide()
        }
    }
    
    override public func isDismissingGuide() {
        self.hostingController?.willMove(toParent: nil)
        self.hostingController?.view.removeFromSuperview()
        self.hostingController?.removeFromParentViewController()
    }
}

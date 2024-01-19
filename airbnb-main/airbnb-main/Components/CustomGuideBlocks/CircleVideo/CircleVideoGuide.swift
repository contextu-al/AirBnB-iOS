//
//  CircleVideoGuide.swift
//  airbnb-main
//
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI
import ContextualSDK

public class CircleVideoGuide: CTXBaseGuideController {
    
    private var hostingController: UIHostingController<CircleVideoView>?
    
    public override func presentGuideBlock(contextualContainer: ContextualContainer,
                                           viewController controller: UIViewController?,
                                           success: @escaping ((CTXIGuidePayload) -> ()),
                                           failure: @escaping ((CTXIGuidePayload) -> ())) {

        guard let controller = controller else {
            failure(contextualContainer.guidePayload)
            return
        }
        
        let guide = contextualContainer.guidePayload.guide
                
        guard let vid_url = guide.extraJson?["vid_url"] as? String else {
            failure(contextualContainer.guidePayload)
            return
        }
        guard let circle_diameter = guide.extraJson?["circle_diameter"] as? Int else {
            let circle_diameter = 150
            return
        }
        
        
        let view = CircleVideoView(vid_url: vid_url, circle_diameter: circle_diameter, dismissbuttonTapped: {
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
        self.hostingController?.view.backgroundColor = .clear
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

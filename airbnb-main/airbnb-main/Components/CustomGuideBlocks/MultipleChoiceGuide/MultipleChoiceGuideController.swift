//
//  MultipleChoiceGuideController.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI
import ContextualSDK

public class MultipleChoiceGuideController: CTXBaseGuideController {
    
    private var hostingController: UIHostingController<SurveyView>?
    
    public override func presentGuideBlock(contextualContainer: ContextualContainer,
                                           viewController controller: UIViewController?,
                                           success: @escaping ((CTXIGuidePayload) -> ()),
                                           failure: @escaping ((CTXIGuidePayload) -> ())) {
        let guide = contextualContainer.guidePayload.guide
        
        let question = MultipleChoiceQuestionModel(
            title: guide.feedback?.feedbackMessage ?? "What are you primarily using our app for?",
            answers: guide.feedback?.arrayOptions as? [String] ?? ["Work", "Fun", "Chat GPT", "I don't know"],
            multiSelect: true,
            tag: "MultipleChoice")
        
        let widgetView = SurveyView(
            title: guide.feedback?.feedbackTitle ?? "Multiple Choice Survey",
            question: question,
            cancelTapped: {
                self.hostingController?.dismiss(animated: true)
                self.dismissGuide()
            },
            doneTapped: {
                self.hostingController?.dismiss(animated: true)
                self.nextStepOfGuide()
            })
        
        self.hostingController = UIHostingController(rootView: widgetView)
        controller?.present(self.hostingController!, animated: true)
        success(contextualContainer.guidePayload)
    }
    
    override public func isDismissingGuide() {
        // Ensure that if the SDK needs to remove the guide, that the guide is actually removed from the view hierarchy
        self.hostingController?.dismiss(animated: true)
    }
}

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
        let title = guide.feedback?.feedbackMessage ?? "What are you primarily using our app for?"
        let choices = guide.feedback?.arrayOptions as? [String] ?? ["Work", "Fun", "Chat GPT", "I don't know"]
        
        let question = MultipleChoiceQuestionModel(
            title: title,
            answers: choices,
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
                let choices = question.choices.filter({ $0.selected }).map { $0.text }
                let feedback = CTXFeedback(title: title, answers: choices, extraJSON: [
                    "answers-array": choices,
                    "any-other-custom-data": "Example custom data"
                ])
                contextualContainer.operations.submitFeedback(feedback,
                                                              forGuide: contextualContainer.guidePayload,
                                                              withHandler: nil)
                
                contextualContainer.operations.submitFeedback(feedback,
                                                              forGuide: contextualContainer.guidePayload,
                                                              withHandler: { request, error in
                    if let error = error {
                        // Handler error here as necessary
                        return
                    }
                    
                    // Handle success here as necessary, such as provide a modal to the user thanking them for their feedback
                })

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

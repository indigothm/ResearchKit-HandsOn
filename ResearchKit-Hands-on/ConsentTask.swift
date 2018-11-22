//
//  ConsentTask.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import ResearchKit

class ConsentTaskInitialiser {
    static func createConsentTask(params: [String:String]) -> ORKOrderedTask {
        var testTask: ORKOrderedTask {
            var steps = [ORKStep]()
            
            //Add VisualConsentStep
            var consentDocument = ConsentDocument
            let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
            steps += [visualConsentStep]
            
            //Add ConsentReviewStep
            let signature = consentDocument.signatures!.first as! ORKConsentSignature
            
            let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
            
            reviewConsentStep.text = "TEST!"
            reviewConsentStep.reasonForConsent = "TEST"
            
            steps += [reviewConsentStep]
            
            return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
        }
        return testTask
    }
}

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //Add VisualConsentStep
    var consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    //Add ConsentReviewStep
    let signature = consentDocument.signatures!.first as! ORKConsentSignature
    
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}

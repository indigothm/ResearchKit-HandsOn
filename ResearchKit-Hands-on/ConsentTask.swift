//
//  ConsentTask.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import ResearchKit

/*
class ConsentTaskInitialiser {
    static func createConsentTask(params: [String:String]) -> ORKOrderedTask {
        var testTask: ORKOrderedTask {
            var steps = [ORKStep]()
            
            //Add VisualConsentStep
            
            let consentDocument = ConsentDocuments().
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
*/

class ConsentTask {
    
    static var sharedInstance = ConsentTask()
    
    func getConsentTaskInstance() -> ORKOrderedTask{
        
        var instance: ORKOrderedTask {
            
            var steps = [ORKStep]()
            
            //Read the parameters
            var nsDictionary: NSDictionary?
            if let path = Bundle.main.path(forResource: "ConsentParameters", ofType: "plist") {
                nsDictionary = NSDictionary(contentsOfFile: path)
            }
            
            //Add VisualConsentStep
            let consentDocuments = ConsentDocuments()
            let consentDocument = consentDocuments.createDocumentWithTypes(paramsDict: nsDictionary ?? NSDictionary())
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
    
    return instance
        
    }
    
    
}


public var ConsentView: ORKTaskViewController {
    let consentModule = ORKTaskViewController(task: ConsentTask.sharedInstance.getConsentTaskInstance(), taskRun: nil)
    consentModule.delegate = ConsentManager.shared
    return consentModule
}

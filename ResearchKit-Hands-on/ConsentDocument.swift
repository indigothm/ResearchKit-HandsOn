//
//  ConsentDocument.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import ResearchKit
import Foundation

class ConsentDocuments {
    func createDocumentWithTypes(paramsDict: NSDictionary) -> ORKConsentDocument {
        //Access the parameters for a type
        let keys = paramsDict.allKeys
        
        let consentSectionTypes: [String : ORKConsentSectionType] = [
            "overview": .overview,
            "dataGathering": .dataGathering,
            "privacy": .privacy,
            "dataUse": .dataUse,
            "timeCommitment": .timeCommitment,
            "studySurvey": .studySurvey,
            "studyTasks": .studyTasks,
            "withdrawing": .withdrawing
        ]
        
        var consentSections: [ORKConsentSection] = []
        
        for key in keys {
            let dataGathering = paramsDict[key] as? NSDictionary
            let consentSection = ORKConsentSection(type: consentSectionTypes[key as! String] as! ORKConsentSectionType)
            let content = dataGathering?["content"]
            print(content)
            let summary = dataGathering?["summary"]
            print(summary)
            consentSection.summary = summary.debugDescription
            consentSection.content = summary.debugDescription
            consentSections.append(consentSection)
        }
        
        var ConsentDocument: ORKConsentDocument {
            
            let consentDocument = ORKConsentDocument()
            consentDocument.title = "Example Consent"
            
            /*
            //consent sections
            let consentSectionTypes: [ORKConsentSectionType] = [
                .overview,
                .dataGathering,
                .privacy,
                .dataUse,
                .timeCommitment,
                .studySurvey,
                .studyTasks,
                .withdrawing
            ]
            
            let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
                let consentSection = ORKConsentSection(type: contentSectionType)
                consentSection.summary = "If you wish to complete this study..."
                consentSection.content = "In this study you will be asked five (wait, no, three!) questions. You will also have your voice recorded for ten seconds."
                return consentSection
            }
            */
            
            consentDocument.sections = consentSections
            
            //signature
            consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
            
            return consentDocument
        }
        
        return ConsentDocument
        
    }
}



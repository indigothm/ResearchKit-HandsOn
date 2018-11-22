//
//  ResultParser.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import Foundation
import ResearchKit

struct ResultParser {
    
    static func findWalkHeartFiles(result: ORKTaskResult) -> [NSURL] {
        
        var urls = [NSURL]()
        
        if let results = result.results, results.count > 4,
            let walkResult = results[3] as? ORKStepResult,
            let restResult = results[4] as? ORKStepResult {
            
            // find ORKFileResults
            for result in walkResult.results! {
                if let result = result as? ORKFileResult,
                    let fileUrl = result.fileURL {
                    urls.append(fileUrl as NSURL)
                }
            }
            
            for result in restResult.results! {
                if let result = result as? ORKFileResult,
                    let fileUrl = result.fileURL {
                    urls.append(fileUrl as NSURL)
                }
            }
        }
        
        return urls
    }
    
    static func findMusicHeartFiles(result: ORKTaskResult) -> NSURL? {
        
        if let results = result.results, results.count > 1,
            let heartResult = results[1] as? ORKStepResult,
            let heartSubresults = heartResult.results, heartSubresults.count > 0,
            let fileResult = heartSubresults[0] as? ORKFileResult,
            let fileURL = fileResult.fileURL {
            
            return fileURL as NSURL
        }
        
        return nil
    }
    
    static func findClip(task: ORKTask?) -> MusicClip? {
        
        if let task = task as? ORKOrderedTask, task.steps.count > 1,
            let musicStep = task.steps[1] as? MusicStep {
            
            return musicStep.clip
            
        } else {
            return nil
        }
    }
}

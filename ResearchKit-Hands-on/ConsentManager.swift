//
//  ConsentManager.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 19/12/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import UIKit
import ResearchKit

class ConsentManager: NSObject, ORKTaskViewControllerDelegate {
    
    static let shared = ConsentManager()
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        print("Complete")
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
}

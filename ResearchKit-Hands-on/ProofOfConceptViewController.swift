//
//  ProofOfConceptViewController.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import UIKit
import ResearchKit

class ProofOfConceptViewController: UIViewController, ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    
    var selection = 0
    var collection = [ORKTaskViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taskViewController1 = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        let taskViewController2 = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        collection.append(taskViewController1)
        collection.append(taskViewController2)
    }
    
    @IBAction func openSelectedDidTouch(_ sender: Any) {
        collection[selection].delegate = self
        present(collection[selection], animated: true, completion: nil)
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func indexChanged(_ sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            //textLabel.text = "First Segment Selected";
            print("1")
            selection = 0
        case 1:
            //textLabel.text = "Second Segment Selected";
            print("2")
            selection = 1
        default:
            break
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import UIKit
import ResearchKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        AVAudioSession.sharedInstance().requestRecordPermission () {
            [unowned self] allowed in
            if allowed {
                // Microphone allowed, do what you like!
                
            } else {
                // User denied microphone. Tell them off!
                
            }
        }
    }


}

extension ViewController : ORKTaskViewControllerDelegate {
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        //Handle results with taskViewController.result
        HealthKitManager.stopMockHeartData()
        if (taskViewController.task?.identifier == "MusicTask"
            && reason == .completed) {
            
            let clip = ResultParser.findClip(task: taskViewController.task)
            print("clip name: \(clip!.rawValue)")
            
            let heartURL = ResultParser.findMusicHeartFiles(result: taskViewController.result)
            if let heartURL = heartURL {
                do {
                    let string = try NSString.init(contentsOf: heartURL as URL, encoding: String.Encoding.utf8.rawValue)
                    print(string)
                } catch {}
            }
        }
        if (taskViewController.task?.identifier == "WalkTask"
            && reason == .completed) {
            
            let heartURLs = ResultParser.findWalkHeartFiles(result: taskViewController.result)
            
            for url in heartURLs {
                do {
                    let string = try NSString.init(contentsOf: url as URL, encoding: String.Encoding.utf8.rawValue)
                    print(string)
                } catch {}
            }
        }
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, viewControllerFor step: ORKStep) -> ORKStepViewController? {
        
        if step.identifier == "music" {
            return MusicStepViewController(step: step)
        } else {
            return nil
        }
    }
    
    @IBAction func consentTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: ConsentTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func surveyTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: SurveyTask, taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func microphoneTapped(sender : AnyObject) {
        let taskViewController = ORKTaskViewController(task: MicrophoneTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] , isDirectory: true) as URL
        present(taskViewController, animated: true, completion: nil)
    }
    
    @IBAction func authorizeTapped(sender: AnyObject) {
        HealthKitManager.authorizeHealthKit()
    }
    
    @IBAction func walkTapped(sender: AnyObject) {
        let taskViewController = ORKTaskViewController(task: WalkTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0],
                                                   isDirectory: true) as URL as URL
        present(taskViewController, animated: true, completion: nil)
        HealthKitManager.startMockHeartData()
    }
    
    @IBAction func musicTapped(sender: AnyObject) {
        let taskViewController = ORKTaskViewController(task: MusicTask, taskRun: nil)
        taskViewController.delegate = self
        taskViewController.outputDirectory = NSURL(fileURLWithPath:
            NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0],
                                                   isDirectory: true) as URL as URL
        present(taskViewController, animated: true, completion: nil)
        HealthKitManager.startMockHeartData()
    }
}

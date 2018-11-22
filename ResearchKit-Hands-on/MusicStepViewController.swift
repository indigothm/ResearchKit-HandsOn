//
//  MusicStepViewController.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import AVFoundation
import ResearchKit

class MusicStepViewController: ORKActiveStepViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    override func start() {
        super.start()
        
        if let step = step as? MusicStep {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: step.clip.fileURL() as URL as URL as URL,
                                                fileTypeHint: AVFileType.mp3.rawValue)
                audioPlayer?.play()
            } catch {}
        }
    }
    
    override func stepDidFinish() {
        super.stepDidFinish()
        audioPlayer?.stop()
    }
}

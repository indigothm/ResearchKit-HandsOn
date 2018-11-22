//
//  MicrophoneTask.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import ResearchKit

public var MicrophoneTask: ORKOrderedTask {
    return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read.", speechInstruction: "These are the last dying words of Joseph of Aramathea", shortSpeechInstruction: "The Holy Grail can be found in the Castle of Aaaaaaaaaaah", duration: 10, recordingSettings: nil, checkAudioLevel: false, options: ORKPredefinedTaskOption.excludeHeartRate)
}

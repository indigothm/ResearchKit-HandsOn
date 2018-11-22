//
//  WalkTask.swift
//  ResearchKit-Hands-on
//
//  Created by Tikhomirov, Elliot (H&B, Marsfield) on 22/11/18.
//  Copyright © 2018 Tikhomirov, Elliot (H&B, Marsfield). All rights reserved.
//

import ResearchKit

public var WalkTask: ORKOrderedTask {
    return ORKOrderedTask.fitnessCheck(withIdentifier: "WalkTask",
                                                         intendedUseDescription: nil,
                                                         walkDuration: 15 as TimeInterval,
                                                         restDuration: 15 as TimeInterval,
                                                         options: [])
}

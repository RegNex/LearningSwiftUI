//
//  Helper.swift
//  TimerApp
//
//  Created by Etornam Sunu on 14/01/2020.
//  Copyright © 2020 Etornam Sunu. All rights reserved.
//

import Foundation

enum TimerMode{
    case running
    case paused
    case initial
}


func secondsToMinutesAndAeconds(seconds:Int)-> String{
    let minutes = "\((seconds % 3600)/60)"
    let seconds = "\((seconds % 3600)%60)"
    let minutesStamp = minutes.count > 1 ? minutes : "0" + minutes
    let secondsStamp = seconds.count > 1 ? seconds : "0" + seconds
    return "\(minutesStamp):\(secondsStamp)"
}

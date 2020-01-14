//
//  TimerManager.swift
//  TimerApp
//
//  Created by Etornam Sunu on 14/01/2020.
//  Copyright © 2020 Etornam Sunu. All rights reserved.
//

import Foundation
import SwiftUI

class TimerManager:ObservableObject{
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
    var timer = Timer()
    
    //start timer
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {
            timer in
            if self.secondsLeft == 0{
                self.reset()
            }
            self.secondsLeft -= 1
        })
    }
    
    //reset timer to 0
    func reset(){
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
//pause timer
    func pause(){
        self.timerMode = .paused
        timer.invalidate()
    }
    
    func setTimerLength(minutes:Int){
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
}

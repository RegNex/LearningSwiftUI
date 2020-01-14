//
//  ContentView.swift
//  TimerApp
//
//  Created by Etornam Sunu on 14/01/2020.
//  Copyright © 2020 Etornam Sunu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedPickerIndex = 0
    let availableMinutes = Array(1...59)
    let myCGFloat = CGFloat(40)
    @ObservedObject var timerManager = TimerManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(secondsToMinutesAndAeconds(seconds: timerManager.secondsLeft))
                    .font(.system(size: 80))
                    .padding(.top,80)
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:180,height:180)
                    .foregroundColor(.orange)
                    .onTapGesture(perform: {
                        if self.timerManager.timerMode == .initial{
                            self.timerManager.setTimerLength(minutes: self.availableMinutes[self.selectedPickerIndex]*60)
                        }
                        self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                    })
                    
                if timerManager.timerMode == .paused {
                Image(systemName: "gobackward")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.top, 40)
                    .onTapGesture(perform: {
                        self.timerManager.reset()
                    })
                }
                if timerManager.timerMode == .initial{
                    Picker(selection: $selectedPickerIndex,
                           label:Text("")){
                            ForEach(0..<availableMinutes.count){
                                Text("\(self.availableMinutes[$0]) min")
                            }
                    }
                        .labelsHidden()
                }
                Spacer()
            }
            .navigationBarTitle("My Timer")
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

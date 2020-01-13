//
//  ContentView.swift
//  HelloWorld
//
//  Created by Etornam Sunu on 13/01/2020.
//  Copyright © 2020 Etornam Sunu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showIcon = false
    
    var body: some View {
        VStack(spacing:50) {
            if showIcon {
                Image("logo")
                        .resizable()
                             .aspectRatio(contentMode: .fill)
                            .frame(width:170,height:170)
                            .clipped()
                    .padding(.top,180)
            }
              Spacer()
            VStack(alignment: .leading, spacing: 10) {
                Text("My first SwiftUI app")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                Text("SwiftUI makes developing IOS apps super easy ")
            }.frame(width: 300, height: 100)
            LogoButton(showIcon: $showIcon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct LogoButton: View {
    @Binding var showIcon:Bool
    
    var body: some View {
        Button(action: {
            self.showIcon.toggle()
        }) {
            Text("Show me the logo!")
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
            
        }
        .padding(.bottom,130)
    }
}

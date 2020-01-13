//
//  DetailView.swift
//  ListView
//
//  Created by Etornam Sunu on 13/01/2020.
//  Copyright © 2020 Etornam Sunu. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let contact:Contact
    var body: some View {
        VStack {
            Image(contact.imageName)
            .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:150,height:150)
            .clipped()
            .cornerRadius(150)
                .shadow(radius: 3)
            Text(contact.name)
                .font(.title)
                .fontWeight(.medium)
            Form{
                Section{
                    HStack {
                                            Text("Phone")
                                            Spacer()
                                            Text(contact.phone)
                                                .foregroundColor(.gray)
                                                .font(.callout)
                                        }
                                        HStack {
                                                       Text("Email")
                                                       Spacer()
                                                       Text(contact.email)
                                                           .foregroundColor(.gray)
                                                           .font(.callout)
                                                   }
                                        HStack {
                                                       Text("Address")
                                                       Spacer()
                                                       Text(contact.address)
                                                           .foregroundColor(.gray)
                                                           .font(.callout)
                                                        .frame(width:180)
                                                   }
                }
                Section{
                    Button(action:{
                        print("send message")
                    }){
                        Text("Send message")
                    }
                    Button(action:{
                        print("Call")
                    }){
                        Text("Call")
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: contacts[0])
    }
}

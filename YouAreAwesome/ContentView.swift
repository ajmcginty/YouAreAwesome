//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Aidan McGinty on 1/19/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var messagesIndex = 0
    @State private var imageName = ""
    @State private var imageNumber = 0
    
    var body: some View {
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Button("Press Me!") {
                    let messages = ["I can and I will",
                                    "No pressure, no diamonds",
                                    "Believe you can and you're halfway there",
                                    "Never give up",
                                    "You're the man!"]
                    
                    imageName = "image\(imageNumber)"
                    imageNumber += 1
                    
                    if imageNumber > 9 {
                        imageNumber = 0
                    }
                    
                    message = messages[messagesIndex]
                    messagesIndex += 1
                    
                    if messagesIndex > messages.count - 1 {
                        messagesIndex = 0
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Aidan McGinty on 1/19/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    
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
                    
                    var messageNumber: Int
                    repeat {
                        messageNumber = Int.random(in:0...(messages.count - 1))
                    } while messageNumber == lastMessageNumber
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    var imageNumber: Int
                    repeat {
                        imageNumber = Int.random(in:0...9)
                    } while imageNumber == lastImageNumber
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
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

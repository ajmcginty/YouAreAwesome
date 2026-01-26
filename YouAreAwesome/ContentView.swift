//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Aidan McGinty on 1/19/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    let numberOfImages = 10
    let numberOfSounds = 6
    
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
            
            Spacer()
            
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
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber,
                                                           upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber,
                                                         upperBounds: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"

                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber,
                                                         upperBounds: numberOfSounds-1)
                    playSound(soundName: "sound\(lastSoundNumber)")
                }
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int{
        var newNumber: Int
        repeat {
            newNumber = Int.random(in:0...upperBounds)
        } while newNumber == lastNumber
        return newNumber
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😡 Could not read file named \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
}

#Preview {
    ContentView()
}

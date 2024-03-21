//
//  ContentView.swift
//  Hangmanapp
//
//  Created by Mushik, Victoria on 3/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wordsGuessed = 0
    @State private var wordsMissed = 0
    @State private var wordsToGuess = ["SLAY", "MEOW", "LOVE"]
    @State private var currentWord = 0
    @State private var gameStatusMessage = "How Many Guesses to Uncover the Secret Word?"
    @State private var guessedLetter = ""
    @State private var playAgainHidden = true
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading) {
                    Text("Words Guessed: \(wordsGuessed)")
                    Text("Words Missed: \(wordsMissed)")
                }
                Spacer()
                VStack (alignment: .leading) {
                    Text("Words to Guess: \(wordsToGuess.count - (wordsGuessed + wordsMissed))")
                    Text("Words in Game: \(wordsToGuess.count)")
                }
            }
            .padding(.horizontal)
            
            Text(gameStatusMessage)
                .font(.title)
                .multilineTextAlignment(.center)
            Spacer()
            
            Text("_ _ _ _")
                .font(.title)
            Spacer()
            Spacer()
            if playAgainHidden {
                HStack{
                    TextField("", text: $guessedLetter)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 30)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.gray, lineWidth: 2)
                        }
                    Button("Guess a Letter") {
                        playAgainHidden = false
                    }
                    .buttonStyle(.bordered)
                    .tint(.mint)
                }
                }
            else {
                Button("Another Word?"){
                    playAgainHidden = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

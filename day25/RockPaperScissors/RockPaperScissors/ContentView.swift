//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by jason on 3/12/24.
//

import SwiftUI

struct Choice: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 100))
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var win = Bool.random()
    @State private var gameChoice = Int.random(in: 0...2)
    @State private var score = 0
    @State private var tries = 0
    @State private var gameOver = false
    
    let choices = ["🪨", "📄", "✂️"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red, .white, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock Paper Scissors")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("\(win ? "Beat" : "Lose to") \(choices[gameChoice])")
                            .foregroundStyle(.white)
                            .font(.title2.weight(.heavy))
                    }
                    .padding()
                    .background(.secondary)
                    .clipShape(.rect(cornerRadius: 20))
                    
                    ForEach(0..<3) { choice in
                        Button {
                            choiceTapped(choice)
                        } label: {
                            Choice(text: choices[choice])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Game Over! Score: \(score)", isPresented: $gameOver) {
            Button("Restart Game", action: reset)
        }
    }
    
    func choiceTapped(_ choice: Int) {
        switch choice {
        case 0: // rock
            if (win && gameChoice == 2) || (!win && gameChoice == 1) {
                score += 1
            } else { score -= 1 }
        case 1: // paper
            if (win && gameChoice == 0) || (!win && gameChoice == 2) {
                score += 1
            } else { score -= 1 }
        case 2: // scissors
            if (win && gameChoice == 1) || (!win && gameChoice == 0) {
                score += 1
            } else { score -= 1 }
        default:
            print("Something horribly wrong happened...")
        }
        tries += 1
        if tries == 10 { gameOver = true }
        win.toggle()
        gameChoice = Int.random(in: 0...2)
    }
    
    func reset() {
        win = Bool.random()
        gameChoice = Int.random(in: 0...2)
        score = 0
        tries = 0
        gameOver = false
    }
}

#Preview {
    ContentView()
}

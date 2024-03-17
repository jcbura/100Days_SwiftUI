//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by jason on 3/9/24.
//

import SwiftUI

struct FlagImage: View {
    var array: [String]
    var number: Int
    
    
    var body: some View {
        Image(array[number])
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var gameFinished = false
    @State private var tries = 0
    
    @State private var animationDegrees = [0.0, 0.0, 0.0]
    @State private var animationOpacity = [1.0, 1.0, 1.0]
    @State private var animationScale = [false, false, false]
    @State private var selectedFlag = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            if number == selectedFlag {
                                animationDegrees[number] += 360
                            }
                            for i in 0..<3 where i != number {
                                animationOpacity[i] *= 0.25
                                animationScale[i] = true
                            }
                        } label: {
                            FlagImage(array: countries, number: number)
                                .rotation3DEffect(.degrees(animationDegrees[number]), axis: (x: 0, y: 1, z: 0))
                                .opacity(animationOpacity[number])
                                .scaleEffect(animationScale[number] ? 0 : 1)
                                
                        }
                    }
                    .animation(.default, value: animationDegrees)
                    .animation(.default, value: animationOpacity)
                    .animation(.default, value: animationScale)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
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
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over!", isPresented: $gameFinished) {
            Button("Restart Game", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        
        tries += 1
        
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }
        
        if tries < 8 {
            showingScore = true
        } else {
            gameFinished = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        selectedFlag = 0
        animationDegrees = [0.0, 0.0, 0.0]
        animationOpacity = [1.0, 1.0, 1.0]
        animationScale = [false, false, false]
        
    }
    
    func reset() {
        askQuestion()
        showingScore = false
        scoreTitle = ""
        score = 0
        gameFinished = false
        tries = 0
    }
}

#Preview {
    ContentView()
}

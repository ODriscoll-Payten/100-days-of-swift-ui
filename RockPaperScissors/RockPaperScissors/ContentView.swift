//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Payten O'Driscoll on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var choices = [ "Rock",  "Paper",  "Scissors"]
    var winningMoves = ["Paper", "Scissors", "Rock"]
    
    @State private var currentChoice = Int.random(in: 0...2)
    
    @State private var correctChoice = 0
    
    @State private var shouldWin = true
    
    @State private var score = 0
    
    @State private var winLoseText = "Win"
    
    @State private var scoreTitle = ""
    
    @State private var alertMessage = ""
    
    @State private var showingResults = false
    
    @State private var showingFinalScore = false
    
    @State private var roundsPlayed = 0
    
    
    var body: some View {
        VStack{
            Text("Try to \(winLoseText)")
                .padding()
            Text("I pick \(choices[currentChoice])")
                .padding()
                .padding()
            Text("you could beat me with \(winningMoves[currentChoice])")
            HStack{
                ForEach(0..<3) { number in
                    Button {
                        buttonPressed(number)
                    } label: {
                        Text(winningMoves[number])
                            
                    }
                }
                .padding()
            }
            
            Text("Score: \(score)")
        }
        .alert(scoreTitle, isPresented: $showingResults) {
            Button("Continue", action: startRound)
        } message: {
            Text(alertMessage)
        }
        
        .alert(scoreTitle, isPresented: $showingFinalScore) {
            Button("Play again", action: startOver)
        } message: {
            Text("Game over your final score was \(score)")
        }
    }
    
    
    func buttonPressed(_ number: Int) {
        correctChoice = currentChoice
            
            roundsPlayed += 1
        if shouldWin == true {
            if number == correctChoice {
                alertMessage = "You beat me this round, lets go again"
                score += 1
                showingResults = true
            } else {
                alertMessage = "I win this round! dont let me fool you."
                score -= 1
                showingResults = true
            }
        } else { if number != correctChoice {
            alertMessage = "You beat me this round, lets go again"
            score += 1
            showingResults = true
        } else {
            alertMessage = "I win this round! dont let me fool you."
            score -= 1
            showingResults = true
        }
            
        }
        
    }
    
    
    func startRound() {
        
        shouldWin = Bool.random()
        currentChoice = Int.random(in: 0...2)
        if shouldWin == true {
            winLoseText = "Win"
        } else {
            winLoseText = "Lose"
        }
    }
    
    
    func startOver() {
        score = 0
        shouldWin = Bool.random()
        currentChoice = Int.random(in: 0...2)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Payten O'Driscoll on 8/17/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingFinalScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionsAsked = 0
    @State private var animationAmount: Double = 360
    
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
            VStack(spacing: 15){
                VStack{
                    Text("Tap the flag of")
                        .foregroundStyle(.secondary)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                    
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                    .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount: 0), axis: (x: 0, y: 1, z: 0))
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
                Spacer()
                Spacer()
                
                Text("Score: \(score)/ 8")
                    .foregroundColor(.white)
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
        .alert(scoreTitle, isPresented: $showingFinalScore){
            Button("Play Again", action: startOver)
        } message: {
            Text("Thank you for playing your final score was \(score) / 8")
        }
       
    }
    
    func flagTapped(_ number: Int) {
        
        questionsAsked += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            withAnimation{
                self.animationAmount += 360
            }
        } else {
            scoreTitle = "Wrong, thats the flag of \(countries[number]) "
            
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        if questionsAsked == 8 {
            showingFinalScore = true
        }
    }
    
    func startOver() {
        score = 0
        questionsAsked = 0
        askQuestion()
    }
    
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

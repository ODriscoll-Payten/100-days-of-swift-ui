//
//  ContentView.swift
//  day 19 challenge
//
//  Created by Payten O'Driscoll on 8/16/22.
//

import SwiftUI


struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var inputAmount = 0
    @State private var unitsOfTime = ["Seconds", "Minutes", "Hours", "Days"]
    @State private var output = 0

    @State private var inputAmountInSeconds = 0
    @State private var inputSelected = 1
    @State private var outputSelected = 1

    var inputInSeconds: Int {
        let input = inputAmount
        let inSelect = inputSelected
        var multiplier = 0
        var inSeconds = 0
        switch inSelect {
        case 0:
            multiplier = 1
        case 1:
            multiplier = 60
        case 2:
            multiplier = 3600
        case 3:
            multiplier = 86400
        default:
            multiplier = 0
        }
        inSeconds = input * multiplier
        return inSeconds
    }
    
    var finalNumber: Double {
        let seconds = Double(inputInSeconds)
        let outSelect = Double(outputSelected)
        var divisor: Double = 0
        var output: Double = 0
        switch outSelect {
        case 0:
            divisor = 1.0
        case 1:
            divisor = 60.0
        case 2:
            divisor = 3600.0
        case 3 :
            divisor = 86400.0
        default:
            divisor = 0.0
        }
        output = seconds / divisor
        return output
    }
    
    var body: some View {
        Form{
            Section{
                
                TextField("Amount", value: $inputAmount, format: .number)
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                
                Picker(selection: $inputSelected, label: Text("Picker")) {
                    ForEach(0..<unitsOfTime.count, id: \.self) { index in
                                       Text(self.unitsOfTime[index]).tag(index)
                                   }
                    
            }
                    .pickerStyle(.segmented)
            } header: {
                Text("input amount of time and unit")
            } footer: {
                Text("=")
                    .multilineTextAlignment(.center)
                    .padding(.leading, 150.0)
                    .padding(.top, 20)
            }
            
           
                
            
            
            
            
            Section{
                Text("\(finalNumber)")
                
                Picker(selection: $outputSelected, label: Text("Picker")) {
                    ForEach(0..<unitsOfTime.count, id: \.self) { index in
                                       Text(self.unitsOfTime[index]).tag(index)
                                   }
            }
                    .pickerStyle(.segmented)
            } header: {
                Text("Select output unit")
            }
            
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

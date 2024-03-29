//
//  ContentView.swift
//  WeSplit
//
//  Created by Payten O'Driscoll on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
  
    
    let tipPercentages = [10, 15, 20, 25, 30, 35, 40, 45, 50, 0]
    
    var totalPerPerson: Double {
        let peopleCount =  Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
       
        let tipValue = checkAmount / 100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
       
        
        return amountPerPerson

    }
    
    var grandTotal: Double {
        let peopleCount =  Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
       
        let tipValue = checkAmount / 100 * tipSelection
        
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    
                }
                
                Section{
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("how much tip do you want to leave?")
                }
                
                
                Section{
                    Text(grandTotal, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Grand total")
                }
                
                
                Section{
                    Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Amount per person")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button ("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }


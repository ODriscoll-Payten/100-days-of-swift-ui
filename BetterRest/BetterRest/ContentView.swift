//
//  ContentView.swift
//  BetterRest
//
//  Created by Payten O'Driscoll on 9/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Date.now, format: .dateTime.hour().minute())
            .padding()
    }
    
    func trivialExample() {
        var components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WeSplit
//
//  Created by Payten O'Driscoll on 4/22/22.
//

import SwiftUI

struct ContentView: View {
    let students = ["harry","hermoine","ron"]
    @State private var selectedStudent = "harry"
    var body: some View {
        NavigationView{
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self){
                        Text($0)
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

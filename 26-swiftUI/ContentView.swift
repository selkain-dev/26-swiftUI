//
//  ContentView.swift
//  26-swiftUI
//
//  Created by S on 17/01/2026.
//

import SwiftUI

struct ContentView: View {
    @State  var name: String = "John"
    @State var score: Int = 114
    var body: some View {
     
        VStack {
            let name2 =  "Denis"
            Button ("change name"){
                name = "Eddie"
            }
            
            Button("change score"){
                score =  223}
            if score > 114{
                Text("hej \(name) and \(name2) (oops hacker here), your score is: \(score).")
            }
            else{
                Text("hej \(name), your score is: \(score).")
            }
            
            //tablice, słowniki klucz -> wartość, zbiory - unikalne elementy
            let colors = ["red", "green", "blue"]
       
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  26-swiftUI
//
//  Created by S on 17/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "flag.poland")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            let name = "Seba"
            var score = 114
            Text("hej, \(name), your score is: \(score).")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

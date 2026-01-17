//
//  ContentView.swift
//  26-swiftUI
//
//  Created by S on 17/01/2026.
//

import SwiftUI

struct ContentView: View {
    // zmienne stanu – zmieniają się w trakcie działania aplikacji i odświeżają UI
    @State var name: String = "John"
    @State var score: Int = 114
    @State var selectedColor: String = ""
    @State var selectedID: Int? = nil
    @State var countdown: Int = 15       // licznik czasu do wyboru kombinacji
    @State var timerStarted: Bool = false // czy timer już ruszył

    // enum – własny typ danych ograniczony do określonych wartości
    enum Volume {
        case low, medium, high
    }
    let loudness = Volume.high

    var body: some View {
        VStack {
            // lokalna zmienna w body, tylko do wyświetlania
            let name2 = "Denis"

            // przycisk zmieniający imię
            Button("change name") {
                name = "Eddie"
            }

            // przycisk zmieniający wynik
            Button("change score") {
                score = 223
            }

            // prosty warunek – różne komunikaty zależnie od wyniku
            if score > 114 {
                Text("hej \(name) and \(name2) (oops hacker here), your score is: \(score).")
            } else {
                Text("hej \(name), your score is: \(score).")
            }

            // przykłady danych:
            let colors = ["red", "green", "blue"]                  // tablica kolorów
            let user: [String: String] = ["Surname": "White", "SSN": "632164578"] // słownik
            let IDs = Set([254,131,222,303,244])                  // zbiór unikalnych ID

            // przyciski wyboru koloru – dynamicznie tworzone dla każdego elementu tablicy
            Text("Wybierz kolor:")
            ForEach(colors, id: \.self) { color in
                // pobieramy pierwszy znak koloru, by użyć go do skrótu klawiaturowego
                if let firstChar = color.lowercased().first {
                    Button(color) {
                        selectedColor = color
                    }
                    .keyboardShortcut(KeyEquivalent(firstChar)) // skrót klawiszowy np. 'r' dla "red"
                }
            }

            // przyciski wyboru ID – z Set konwertowanego na Array, bo ForEach wymaga kolekcji indeksowalnej
            Text("Wybierz ID:")
            ForEach(Array(IDs), id: \.self) { id in
                Button("ID: \(id)") {
                    selectedID = id
                }
            }

            // timer i odliczanie czasu – onAppear uruchamia się, gdy widok pojawia się na ekranie
            if countdown > 0 {
                Text("Wybierz kombinację! Czas: \(countdown)s")
                    .onAppear {
                        // Timer odlicza co sekundę, zmniejsza countdown
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                            if countdown > 0 {
                                countdown -= 1
                            } else {
                                timer.invalidate() // zatrzymanie timera
                            }
                        }
                    }
            } else {
                // komunikaty po zakończeniu czasu – czy wybrano poprawną kombinację
                if selectedColor == "green" && selectedID == 222 {
                    Text("Udało Ci się odszyfrować telefon! Wybrano poprawną kombinację – haker nie udostępni Twoich wrażliwych danych")
                } else {
                    Text("Zła kombinacja lub brak wyboru – udostępniono Twoje dane :) – pozdrowienia od hakera")
                }
            }

            // dane użytkownika wyświetlane ze słownika
            Text("User data")
            Text("Surname: \(user["Surname"] ?? "Unknown")")
            Text("SSN: \(user["SSN"] ?? "Unknown")")
        }
        // dotknięcie ekranu uruchamia timer
        .onTapGesture {
            if !timerStarted {
                timerStarted = true
                countdown = 15
            }
        }
        .padding() // odstępy wewnątrz VStack
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  TamagotchiiOSApp
//
//  Created by Jaswal, Eesa (SPH) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi()
    
    var body: some View {
        VStack {
            Text("\(tamagotchi.displayStats())")
            Button("Feed \(tamagotchi.name)", action: {
                tamagotchi.changeHunger(newHunger: -1)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

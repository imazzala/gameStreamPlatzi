//
//  GameStreamApp.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 20/10/2021.
//

import SwiftUI

@main
struct GameStreamApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
            
        }.onChange(of: scenePhase) { newValue in
            
            print(newValue)
            
            if newValue == .inactive {
                print("La app está inactiva, guardaré los datos para despues continuar fluidamente")
            }
            
        }
    }
}

//
//  ATipJarApp.swift
//  ATipJar
//
//  Created by avalan.zhang on 6/24/24.
//

import SwiftUI

@main
struct ATipJarApp: App {
    
    @StateObject private var store = TipsStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}

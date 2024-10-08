//
//  LandmarkMapAppApp.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 12/9/2024.
//

import SwiftUI

@main
struct LandmarkMapAppApp: App {
    
    @StateObject private var jvm = JournalViewModel()
    
    var body: some Scene {
        WindowGroup {
            SearchableMap()
                .environmentObject(jvm)
        }
    }
}

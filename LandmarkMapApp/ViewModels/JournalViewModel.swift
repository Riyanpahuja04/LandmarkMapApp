//
//  JournalViewModel.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 16/9/2024.
//

import Foundation

class JournalViewModel: ObservableObject {
    @Published var savedLocations: [Location] = []
    
    func saveLocation (_ location: Location) {
        savedLocations.append(location)
    }
}

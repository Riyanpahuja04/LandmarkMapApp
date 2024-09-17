//
//  JournalViewModel.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 16/9/2024.
//

import Foundation
import SwiftUI

class JournalViewModel: ObservableObject {
    @Published var savedJournals: [Journal] = []
    @Published var showJournalEntry: Bool = false
    @Published var currentSelectedLocation: Pin?
    
    func saveJournal (notes: String, images: [UIImage]) {
        let imageData = images.compactMap { $0.jpegData(compressionQuality: 0.8) }
        let journal = Journal(location: currentSelectedLocation!, notes: notes, images: imageData)
        savedJournals.append(journal)
    }
    
    func saveButtonPressed(withLocation location: Pin){
        showJournalEntry = true
        currentSelectedLocation = location
    }
}

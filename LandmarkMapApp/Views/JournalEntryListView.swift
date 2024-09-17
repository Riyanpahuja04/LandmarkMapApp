//
//  JournalEntryListView.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import SwiftUI

struct JournalEntryListView: View {
    @EnvironmentObject private var jvm: JournalViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(jvm.savedJournals) { journal in
                    NavigationLink {
                        JournalDetailsView(journal: journal)
                    } label: {
                        HStack {
                            if let imageData = journal.images.first {
                                if let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 45, height: 45)
                                        .cornerRadius(10)
                                }
                            }
                            
                                Text(journal.location.name)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            //this frame is necessary to avoid any rendering issue if the names become too big
                    }
                    }
                    
                }
            }
            .navigationTitle("Journals")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        JournalEntryListView()
            .environmentObject(JournalViewModel())
    }
}

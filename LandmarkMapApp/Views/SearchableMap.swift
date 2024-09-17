//
//  SearchableMap.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 16/9/2024.
//

import SwiftUI
import MapKit

struct SearchableMap: View {
    @EnvironmentObject var jvm: JournalViewModel
    @State private var position = MapCameraPosition.automatic
    @State private var searchResults = [SearchResult]()
    @State private var selectedLocation: SearchResult?
    @State private var isSheetPresented: Bool = true
    @State private var scene: MKLookAroundScene?
    @State private var result: Pin = .init(name: "", location: CLLocationCoordinate2D())
    @State private var isJournalListPresented: Bool = false
    
    var body: some View {
        ZStack {
            mapLayer
            .sheet(isPresented: $isSheetPresented) {
                SheetView(result: $result, searchResults: $searchResults)
        }
            if self.result.name != "" {
                saveButton
            }
            
            journalsButton
            
            
        }
    }

    private func fetchScene(for coordinate: CLLocationCoordinate2D) async throws -> MKLookAroundScene? {
        let lookAroundScene = MKLookAroundSceneRequest(coordinate: coordinate)
        return try await lookAroundScene.scene
    }
}

extension SearchableMap {
    private var mapLayer: some View {
        Map(position: $position, selection: $selectedLocation) {
            ForEach(searchResults) { result in
                Marker(coordinate: result.location) {
                    VStack {
                        Image(systemName: "mappin")
                        Text(self.result.name)
                    }
                }
                .tag(result)
            }
        }
        .overlay(alignment: .bottom) {
            if selectedLocation != nil {
                LookAroundPreview(scene: $scene, allowsNavigation: false, badgePosition: .bottomTrailing)
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .safeAreaPadding(.bottom, 40)
                    .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea()
        .onChange(of: selectedLocation) {
            if let selectedLocation {
                Task {
                    scene = try? await fetchScene(for: selectedLocation.location)
                }
            }
            isSheetPresented = selectedLocation == nil
        }
        .onChange(of: searchResults) {
            if let firstResult = searchResults.first, searchResults.count == 1 {
                selectedLocation = firstResult
            }
        }
    }
    
    private var saveButton: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action: {
                    jvm.saveButtonPressed(withLocation: self.result)
                }, label: {
                        Image(systemName: "note.text.badge.plus")
                            .frame(width: 35, height: 35)
                })
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            Spacer()
        }
        .sheet(isPresented: $jvm.showJournalEntry, content: {
            NewJournalEntryView()
        })
    }
    
    private var journalsButton: some View {
        VStack {
            HStack {
                Button(action: {
                    isJournalListPresented.toggle()
                }, label: {
                        Image(systemName: "note")
                    .frame(width: 35, height: 35)
                })
                .buttonStyle(.borderedProminent)
                
                Spacer()
            }
            .padding()
            
            Spacer()
        }
        .sheet(isPresented: $isJournalListPresented, content: {
            JournalEntryListView()
        })
    }
}

#Preview {
    SearchableMap()
        .environmentObject(JournalViewModel())
}

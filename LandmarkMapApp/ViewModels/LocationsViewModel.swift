//
//  LocationsViewModel.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 12/9/2024.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    // current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list locations
    @Published var showLocationsList: Bool = false
    
    // show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        //TODO: change this when adding API
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut, {
            mapRegion = MKCoordinateRegion(center: location.coordinates,
                                           span: mapSpan)
        })
        
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        // Get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation }) else {
            print("Could not find current index in locations array!")
            return
        }
        
        let nextIndex = currentIndex + 1
        // check if next location is valid
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        // Next index is valid
        let nextLocation = locations[nextIndex]
        
        showNextLocation(location: nextLocation)
    }
}

//
//  LocationsView.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 12/9/2024.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var lvm: LocationsViewModel
    
    let maxWidthForIpad: CGFloat = 700
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                
                Spacer()
                
                locationPreviewStack
                
            }
        }
        .sheet(item: $lvm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: lvm.toggleLocationsList) {
                Text(lvm.mapLocation.name + ", " + lvm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: lvm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: lvm.showLocationsList ? 180 : 0))
                    }
            }
            .buttonStyle(.plain)
            
            if lvm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y:15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $lvm.mapRegion, annotationItems: lvm.locations, annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(lvm.mapLocation == location ? 1 : 0.7)
                    .onTapGesture {
                        lvm.showNextLocation(location: location)
                    }
            }
        })
        
    }
    
    private var locationPreviewStack: some View {
        ZStack {
            ForEach(lvm.locations) { location in
                if(lvm.mapLocation == location) {
                    LocationPreview(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
        
    }
}

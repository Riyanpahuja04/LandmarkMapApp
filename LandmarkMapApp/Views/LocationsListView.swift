//
//  LocationsListView.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 12/9/2024.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var lvm: LocationsViewModel
    var body: some View {
        List {
            ForEach(lvm.locations) { location in
                Button(action: {
                    lvm.showNextLocation(location: location)
                }
                    ) {
                    listRowView(location: location)
                        .padding(.vertical, 4)
                        .listRowBackground(Color.clear)
                }
                .buttonStyle(.plain)
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            //this frame is necessary to avoid any rendering issue if the names become too big
        }
    }
}

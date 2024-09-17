//
//  Pin.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import Foundation
import MapKit

struct Pin: Identifiable {
    let id = UUID().uuidString
    var name: String
    var coordinates: CLLocationCoordinate2D
}

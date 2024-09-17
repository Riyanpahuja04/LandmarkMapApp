//
//  Pin.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import Foundation
import MapKit

struct Pin: Identifiable, MapRelation {
    let id = UUID().uuidString
    var name: String
    var location: CLLocationCoordinate2D
}

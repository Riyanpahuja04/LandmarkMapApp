//
//  SearchResult.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import Foundation
import MapKit

struct SearchResult: Identifiable, Hashable, MapRelation {
    let id = UUID()
    var location: CLLocationCoordinate2D

    static func == (lhs: SearchResult, rhs: SearchResult) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

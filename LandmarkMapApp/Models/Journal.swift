//
//  Journal.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import Foundation

struct Journal: Identifiable {
    let id: String = UUID().uuidString
    let location: Pin
    let notes: String
    let images: [Data]
}

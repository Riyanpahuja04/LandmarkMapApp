//
//  SearchCompletions.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 17/9/2024.
//

import Foundation

struct SearchCompletions: Identifiable {
    let id = UUID()
    let title: String
    let subTitle: String
    // New property to hold the URL if it exists
    var url: URL?
}

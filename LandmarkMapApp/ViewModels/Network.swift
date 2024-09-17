//
//  Network.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 15/9/2024.
//

import Foundation

protocol Network {
    
    var AUTH_TOKEN: String {get}
    
    func generateRequest() -> URLRequest
    func parseResponse()
    func handleError()
}

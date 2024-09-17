//
//  PlacesAPI.swift
//  LandmarkMapApp
//
//  Created by Riyan Pahuja on 15/9/2024.
//

import Foundation

class PlacesAPI: Network {
    var AUTH_TOKEN: String = "AIzaSyAEh3SvyOws6knHaGaGosPfi4QZ6e0m28w"
    let baseUrl: String = "https://places.googleapis.com/v1/"
    internal func generateRequest() -> URLRequest {
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=restaurants&location=-33.8839618%2C151.1506293&radius=1500&type=cafe&key=AIzaSyCKALaGpmMydSMCjQzpLwm0JkQLFNDRO50")!
        let request = URLRequest(url: url)
        return request
    }
    
    func nearbySearch() {
        let request = generateRequest()
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue(AUTH_TOKEN, forHTTPHeaderField: "X-Goog-Api-Key")
//        request.addValue("places.name,places.formattedAddress", forHTTPHeaderField: "X-Goog-FieldMask")
//        
//        let requestBody = NearbySearchRequest(
//            locationRestriction: LocationRestriction(
//                circle: Circle(
//                    center: Center(latitude: 37.7749, longitude: -122.4194),
//                    radius: 1000.0
//                )
//            ),
//            includedTypes: ["restaurant"]
//        )
//
//        let jsonData = try? JSONEncoder().encode(requestBody)
//        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let data = data {
                // Parse the JSON response
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response: \(json)")
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }
        
        task.resume()

    }
    
    internal func parseResponse() {
        print("did Nothing")
    }
    
    internal func handleError() {
        
    }
    
    
}

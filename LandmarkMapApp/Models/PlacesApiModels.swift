struct LocationRestriction: Codable {
    let circle: Circle
}

struct Circle: Codable {
    let center: Center
    let radius: Double
}

struct Center: Codable {
    let latitude: Double
    let longitude: Double
}

struct NearbySearchRequest: Codable {
    let locationRestriction: LocationRestriction
    let includedTypes: [String]
}

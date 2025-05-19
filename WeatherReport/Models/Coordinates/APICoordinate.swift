//
//  APICoordinate.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation

struct APICoordinate: Codable {
    let name: String
    let localNames: [String: String]
    let lat: Double
    let long: Double
    let country: String
    let state: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case localNames = "local_names"
        case lat = "lat"
        case long = "lon"
        case country = "country"
        case state = "state"
    }
}


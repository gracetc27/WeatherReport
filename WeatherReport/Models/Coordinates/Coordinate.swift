//
//  Coordinate.swift
//  WeatherReport
//
//  Created by Grace couch on 23/05/2025.
//
import Foundation

struct Coordinate: Codable, Identifiable {
    let id: UUID
    let name: String
    let localNames: [String: String]
    let lat: Double
    let lon: Double
    let country: String
    let state: String
    var isSelected: Bool
}

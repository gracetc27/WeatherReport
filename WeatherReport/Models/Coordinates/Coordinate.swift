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

    static let defaultPlace = Coordinate(
        id: UUID(),
        name: "London",
        localNames: ["London": "London"],
        lat: 300.6,
        lon: 250.5,
        country: "England",
        state: "Greater london",
        isSelected: true)
}

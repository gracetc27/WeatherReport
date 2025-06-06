//
//  Coordinate.swift
//  WeatherReport
//
//  Created by Grace couch on 23/05/2025.
//
import Foundation

struct Coordinate: Codable, Equatable, Identifiable {
    let id: UUID
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String

    static let defaultPlace = Coordinate(
        id: UUID(),
        name: "London",
        lat: 300.6,
        lon: 250.5,
        country: "England",
        state: "Greater london")
}

//
//  APICoordinate.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation

struct APICoordinate: Codable {
    let name: String
    let lat: Double
    let lon: Double
    let country: String
    let state: String
}


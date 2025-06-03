//
//  PlaceManager.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import Foundation

@Observable
class PlaceManager {
    var recentSelectedPlace: Coordinate?

    private let savePath = URL.documentsDirectory.appendingPathComponent("recent place")


    func loadSavedPlace() async throws {
        do {
            let data = try Data(contentsOf: savePath)
            recentSelectedPlace = try JSONDecoder().decode(Coordinate.self, from: data)
        } catch {
            throw error
        }
    }

    func savePlace(_ place: Coordinate) throws {
        do {
            recentSelectedPlace = place
            let data = try JSONEncoder().encode(recentSelectedPlace)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            throw error
        }
    }
}


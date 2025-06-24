//
//  PlaceManager.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import Foundation

@Observable
class PlaceManager: PlaceManagerProtocol {

    private let savePath = URL.documentsDirectory.appendingPathComponent("recent place")


    func loadSavedPlace() async throws(SaveLoadError) -> Coordinate {
        do {
            let data = try Data(contentsOf: savePath)
            let recentSelectedPlace = try JSONDecoder().decode(Coordinate.self, from: data)
            return recentSelectedPlace
        } catch {
            throw .loadingFailed
        }
    }

    func savePlace(_ place: Coordinate) throws(SaveLoadError) {
        do {
            let data = try JSONEncoder().encode(place)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            throw .savingFailed
        }
    }
}


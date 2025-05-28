//
//  PlaceManager.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import Foundation

class PlaceManager {
    var recentSelectedPlace: Coordinate = .defaultPlace

    private let savePath = URL.documentsDirectory.appendingPathComponent("default place")


    func loadSavedPlace() async {
        do {
            let data = try Data(contentsOf: savePath)
            recentSelectedPlace = try JSONDecoder().decode(Coordinate.self, from: data)
        } catch {
            print(error.localizedDescription)
            recentSelectedPlace = .defaultPlace
        }
    }

    func savePlace(_ place: Coordinate) {
        do {
            recentSelectedPlace = place
            let data = try JSONEncoder().encode(recentSelectedPlace)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}


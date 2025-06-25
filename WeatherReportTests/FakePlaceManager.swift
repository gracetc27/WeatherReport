//
//  FakePlaceManager.swift
//  WeatherReport
//
//  Created by Grace couch on 25/06/2025.
//
@testable import WeatherReport
import Foundation

class FakePlaceManager: PlaceManagerProtocol {
    let loadSavedPlaceResult: Result<Coordinate, SaveLoadError>

    init(loadSavedPlaceResult: Result<Coordinate, SaveLoadError>) {
        self.loadSavedPlaceResult = loadSavedPlaceResult
    }

    func loadSavedPlace() async throws(SaveLoadError) -> Coordinate {
        try loadSavedPlaceResult.get()
    }

    func savePlace(_ place: Coordinate) throws(SaveLoadError) {}
}

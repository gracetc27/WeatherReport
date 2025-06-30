//
//  FakePlaceManager.swift
//  WeatherReport
//
//  Created by Grace couch on 25/06/2025.
//
@testable import WeatherReport
import Foundation

class FakePlaceManager: PlaceManagerProtocol {
    var saveCallCount = 0
    var testSavePlace: Coordinate?
    let loadSavedPlaceResult: Result<Coordinate, SaveLoadError>
    let savePlaceResult: Result<Void, SaveLoadError>

    init(
        loadSavedPlaceResult: Result<Coordinate, SaveLoadError> = .success(.defaultPlace),
        savePlaceResult: Result<Void, SaveLoadError> = .success(())
    ) {
        self.loadSavedPlaceResult = loadSavedPlaceResult
        self.savePlaceResult = savePlaceResult
    }

    func loadSavedPlace() async throws(SaveLoadError) -> Coordinate {
        try loadSavedPlaceResult.get()
    }

    func savePlace(_ place: Coordinate) throws(SaveLoadError) {
        saveCallCount += 1
        testSavePlace = place
        try savePlaceResult.get()
    }
}

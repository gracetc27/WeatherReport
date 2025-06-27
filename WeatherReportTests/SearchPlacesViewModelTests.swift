//
//  SearchPlacesViewModelTests.swift
//  WeatherReport
//
//  Created by Grace couch on 05/06/2025.
//

import Testing
@testable import WeatherReport
import Foundation

struct SearchPlacesViewModelTests {

    @Test func searchPlacesUpdatesPlaceSuccess() async throws {
        let fakePlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let fakeSuccessService = FakeWeatherServiceSuccess()
        let sut = SearchPlacesViewModel(placeManager: fakePlaceManager, service: fakeSuccessService)

        #expect(sut.place == nil)

        sut.searchText = "London"

        await sut.searchPlaces()
        #expect(sut.place?.name == "London")
    }

    @Test func searchPlacesUpdatesPlaceFailure() async throws {
        let fakePlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let fakeFailureService = FakeWeatherServiceFailure()
        let sut = SearchPlacesViewModel(placeManager: fakePlaceManager, service: fakeFailureService)
        
        #expect(sut.place == nil)
        
        sut.searchText = "London"

        await sut.searchPlaces()

        #expect(sut.place == nil)
        #expect(sut.placeError == .decodingFailed)
    }
}

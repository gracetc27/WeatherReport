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

    @Test func getWeatherUpdatesWeatherSuccess() async throws {
        let fakePlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let fakeSuccessService = FakeWeatherServiceSuccess()
        let sut = SearchPlacesViewModel(placeManager: fakePlaceManager, service: fakeSuccessService)

        #expect(sut.weather == nil)
        sut.place = .defaultPlace

        let expectedWeather = Weather(
            coord: APICoord(lon: 250.1, lat: 50.7),
            weather: [APIWeatherIcon(
                id: 1,
                main: "weather icon 1",
                description: "rain",
                icon: "10d")],
            main: MainWeather(
                temp: 10.1,
                feelsLike: 12.2,
                tempMin: 5.6,
                tempMax: 14.5,
                pressure: 3,
                humidity: 4),
            wind: Wind(
                speed: 20.2,
                deg: 30,
                gust: 23.7),
            clouds: APIClouds(
                all: 63),
            rain: Rain(
                perHour: 2.73)
        )

        await sut.getWeatherForCoord()

        #expect(sut.weather == expectedWeather)

    }

    @Test func getWeatherUpdatesWeatherFailure() async throws {
        let fakePlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let fakeFailureService = FakeWeatherServiceFailure()
        let sut = SearchPlacesViewModel(placeManager: fakePlaceManager, service: fakeFailureService)

        #expect(sut.weather == nil)

        sut.place = .defaultPlace

        await sut.getWeatherForCoord()

        #expect(sut.weather == nil)
        #expect(sut.weatherError == .decodingFailed)
    }

    @Test func saveRecentPlaceSuccess() async throws {
        let fakePlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace), savePlaceResult: .success(()))
        let fakeSuccessService = FakeWeatherServiceSuccess()
        let sut = SearchPlacesViewModel(placeManager: fakePlaceManager, service: fakeSuccessService)
        
        sut.place = .defaultPlace

        sut.saveRecentPlace()

        #expect(fakePlaceManager.saveCallCount == 1)
        #expect(fakePlaceManager.testSavePlace == .defaultPlace)
    }

    @Test func saveRecentPlaceFailure() async throws {
        let fakePlaceManager = FakePlaceManager(loadSavedPlaceResult: .failure(.savingFailed), savePlaceResult: .failure(.savingFailed))
        let fakeSuccessService = FakeWeatherServiceSuccess()
        let sut = SearchPlacesViewModel(placeManager: fakePlaceManager, service: fakeSuccessService)

        sut.place = .defaultPlace

        sut.saveRecentPlace()

        #expect(sut.saveError == .savingFailed)
    }
}

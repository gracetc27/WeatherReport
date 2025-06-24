//
//  HomeViewModelTests.swift
//  WeatherReportTests
//
//  Created by Grace couch on 16/05/2025.
//

import Testing
@testable import WeatherReport
import Foundation

struct HomeViewModelTests {

    @Test func loadRecentPlaceUpdatesPlaceSuccess() async throws {
        let testPlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let sut = HomeViewModel(placeManager: testPlaceManager, service: FakeWeatherServiceSuccess())
        #expect(sut.recentPlace == nil)
        await sut.loadRecentPlace()

        #expect(sut.recentPlace == .defaultPlace)
    }

    @Test func loadRecentPlaceUpdatesPlaceFailure() async throws {
        let testPlaceManager = FakePlaceManager(loadSavedPlaceResult: .failure(.loadingFailed))
        let sut = HomeViewModel(placeManager: testPlaceManager, service: FakeWeatherServiceSuccess())
        #expect(sut.recentPlace == nil)

        await sut.loadRecentPlace()

        #expect(sut.recentPlace == nil)
        #expect(sut.recentPlaceError == .loadingFailed)
        #expect(sut.isShowingPlaceError == true)
    }

    @Test func getWeatherUpdatesRecentWeatherSuccess() async throws {
        let testPlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let sut = HomeViewModel(placeManager: testPlaceManager, service: FakeWeatherServiceSuccess())
        await sut.loadRecentPlace()

        #expect(sut.recentWeather == nil)

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

        await sut.getWeatherForRecentPlace()

        #expect(sut.recentWeather == expectedWeather)
    }

    @Test func getWeatherUpdatesRecentWeatherFailure() async throws {
        let testPlaceManager = FakePlaceManager(loadSavedPlaceResult: .success(.defaultPlace))
        let sut = HomeViewModel(placeManager: testPlaceManager, service: FakeWeatherServiceFailure())
        await sut.loadRecentPlace()

        #expect(sut.recentWeather == nil)

        await sut.getWeatherForRecentPlace()

        #expect(sut.recentWeather == nil)

        #expect(sut.weatherError != nil)
        #expect(sut.isShowingWeatherError == true)
    }
}





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

class FakeWeatherServiceSuccess: WeatherServiceProtocol {
    func getCoordinates(searchTerm: String) async throws(APIError) -> [APICoordinate] {
        return [
            APICoordinate(
            name: "London",
            lat: 300.6,
            lon: 250.5,
            country: "England",
            state: "Greater london")
        ]
    }
    
    func getWeather(lon: Double, lat: Double) async throws(APIError) -> APIWeather {
        return APIWeather(
                coord: APICoord(lon: 250.1, lat: 50.7),
                weather: [APIWeatherIcon(
                    id: 1,
                    main: "weather icon 1",
                    description: "rain",
                    icon: "10d")],
                main: APIMainWeather(
                    temp: 10.1,
                    feelsLike: 12.2,
                    tempMin: 5.6,
                    tempMax: 14.5,
                    pressure: 3,
                    humidity: 4),
                wind: APIWind(
                    speed: 20.2,
                    deg: 30,
                    gust: 23.7),
                rain: APIRain(
                    perHour: 2.73),
                clouds: APIClouds(
                    all: 63),
            )
    }
    
    func getWeatherIconURL(iconString: String) -> URL {
        URL(filePath: "TestImage.jpeg")
    }

}

class FakeWeatherServiceFailure: WeatherServiceProtocol {
    func getCoordinates(searchTerm: String) async throws(APIError) -> [APICoordinate] {
        throw .decodingFailed
    }
    
    func getWeather(lon: Double, lat: Double) async throws(APIError) -> APIWeather {
        throw .decodingFailed
    }
    
    func getWeatherIconURL(iconString: String) -> URL {
        URL(filePath: "TestImage.jpeg")
    }

}

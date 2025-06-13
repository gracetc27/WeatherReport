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
        let testPlaceManager = FakePlaceManager()
        let sut = HomeViewModel(placeManager: testPlaceManager, service: FakeWeatherServiceSuccess())
        #expect(sut.recentPlace == nil)

        try testPlaceManager.savePlace(.defaultPlace)

        await sut.loadRecentPlace()

        #expect(sut.recentPlace == .defaultPlace)
    }

    @Test func loadRecentPlaceUpdatesPlaceFailure() async throws {


    }
}

class FakePlaceManager: PlaceManagerProtocol {
    var recentSelectedPlace: Coordinate?
    private let savePath = URL.documentsDirectory.appendingPathComponent("test place manager")

    func loadSavedPlace() async throws(SaveLoadError) {
        do {
            let data = try Data(contentsOf: savePath)
            recentSelectedPlace = try JSONDecoder().decode(Coordinate.self, from: data)
        } catch {
            throw .loadingFailed
        }
    }
    
    func savePlace(_ place: Coordinate) throws(SaveLoadError) {
        do {
            recentSelectedPlace = place
            let data = try JSONEncoder().encode(recentSelectedPlace)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            throw .savingFailed
        }
    }
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

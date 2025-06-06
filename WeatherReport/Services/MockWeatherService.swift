//
//  MockWeatherService.swift
//  WeatherReport
//
//  Created by Grace couch on 06/06/2025.
//

import Foundation

class MockWeatherService: WeatherServiceProtocol {
    func getCoordinates(searchTerm: String) async throws(APIError) -> [APICoordinate] {
        return [APICoordinate(
            name: "London",
            lat: 51.5073219,
            lon: -0.1276474,
            country: "GB",
            state: "England")]
    }

    func getWeather(lon: Double, lat: Double) async throws(APIError) -> APIWeather {
        return APIWeather(
            coord: APICoord(
                lon: 7.367,
                lat: 45.133),
            weather: [APIWeatherIcon(
                id: 501,
                main: "Rain",
                description: "moderate rain",
                icon: "10d")],
            main: APIMainWeather(
                temp: 284.2,
                feelsLike: 282.93,
                tempMin: 283.06,
                tempMax: 286.82,
                pressure: 1021,
                humidity: 60),
            wind: APIWind(
                speed: 4.09,
                deg: 121,
                gust: 3.47),
            rain: APIRain(perHour: 2.73),
            clouds: APIClouds(all: 83))
    }

    func getWeatherIconURL(iconString: String) -> URL {
        let iconURLString = "https://openweathermap.org/img/wn/\(iconString)@2x.png"
        return URL(string: iconURLString)!
    }
}


//
//  Weather.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import Foundation

struct Weather: Codable {
    let coord: Coord
    let weather: [WeatherIcon]
    let main: MainWeather
    let wind: Wind
    static let defaultWeather = Weather(
        coord: Coord(lon: 250.1, lat: 50.7),
        weather: [WeatherIcon(
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
            humidity: 4,
            seaLevel: 100,
            grndLevel: 90),
        wind: Wind(
            speed: 20.2,
            deg: 30,
            gust: 23.7)
    )
}

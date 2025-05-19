//
//  APIWeatherComponents.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation


struct WeatherIcon: Codable {
    let id: Int
    let main, description, icon: String
}

struct MainWeather: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

struct Coord: Codable {
    let lon, lat: Double
}

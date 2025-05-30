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
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity, seaLevel, grndLevel: Int?
}

struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct Coord: Codable {
    let lon, lat: Double
}

struct Rain: Codable {
    let perHour: Double?

    enum CodingKeys: String, CodingKey {
        case perHour = "1h"
    }
}

struct Clouds: Codable {
    let all: Int
}


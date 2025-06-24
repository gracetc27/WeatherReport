//
//  APIWeatherComponents.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation


struct APIWeatherIcon: Codable, Equatable {
    let id: Int
    let main, description, icon: String
}

struct APIMainWeather: Codable, Equatable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?
}

struct APIWind: Codable, Equatable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct APICoord: Codable, Equatable {
    let lon, lat: Double
}

struct APIRain: Codable, Equatable {
    let perHour: Double?

    enum CodingKeys: String, CodingKey {
        case perHour = "1h"
    }
}

struct APIClouds: Codable, Equatable {
    let all: Int
}


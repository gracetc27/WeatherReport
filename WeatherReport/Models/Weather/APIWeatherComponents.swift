//
//  APIWeatherComponents.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation


struct APIWeatherIcon: Codable {
    let id: Int
    let main, description, icon: String
}

struct APIMainWeather: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?
}

struct APIWind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct APICoord: Codable {
    let lon, lat: Double
}

struct APIRain: Codable {
    let perHour: Double?

    enum CodingKeys: String, CodingKey {
        case perHour = "1h"
    }
}

struct APIClouds: Codable {
    let all: Int
}


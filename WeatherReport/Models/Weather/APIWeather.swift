//
//  APIWeather.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation

struct APIWeather: Codable {
    let coord: APICoord
    let weather: [APIWeatherIcon]
    let main: APIMainWeather
    let wind: APIWind
    let rain: APIRain?
    let clouds: APIClouds
}




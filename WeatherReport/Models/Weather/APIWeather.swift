//
//  APIWeather.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation

struct APIWeather: Codable {
    let coord: Coord
    let weather: [WeatherIcon]
    let main: MainWeather
    let wind: Wind
    let rain: Rain?
    let clouds: Clouds
}




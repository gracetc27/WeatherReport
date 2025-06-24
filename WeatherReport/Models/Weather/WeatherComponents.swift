//
//  WeatherComponents.swift
//  WeatherReport
//
//  Created by Grace couch on 04/06/2025.
//

import Foundation


struct MainWeather: Codable, Equatable {
    let temp, feelsLike, tempMin, tempMax: Double?
    var tempMeasurement: Measurement<UnitTemperature>? {
        Measurement(value: temp ?? 0, unit: .celsius)
    }
    var feelsLikeMeasurement: Measurement<UnitTemperature>? {
        Measurement(value: feelsLike ?? 0, unit: .celsius)
    }
    var tempMinMeasurement: Measurement<UnitTemperature>? {
        Measurement(value: tempMin ?? 0, unit: .celsius)
    }
    var tempMaxMeasurement: Measurement<UnitTemperature>? {
        Measurement(value: tempMax ?? 0, unit: .celsius)
    }
    
    let pressure, humidity: Int?
}

struct Wind: Codable, Equatable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
    var speedInMeasurement: Measurement<UnitSpeed>? {
        Measurement(value: speed ?? 0, unit: .metersPerSecond)
    }
    var gustInMeasurement: Measurement<UnitSpeed>? {
        Measurement(value: gust ?? 0, unit: .metersPerSecond)
    }
}

struct Rain: Codable, Equatable {
    let perHour: Double?
    var perHourMeasurement: Measurement<UnitLength>? {
        Measurement(value: perHour ?? 0, unit: .millimeters)
    }
}


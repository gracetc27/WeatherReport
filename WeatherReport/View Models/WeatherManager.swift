//
//  WeatherManager.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import Foundation

class WeatherManager {
    var userSelectedWeather: Weather = .defaultWeather

    private let savePath = URL.documentsDirectory.appendingPathComponent("weather")


    func loadSavedSources() async {
        do {
            let data = try Data(contentsOf: savePath)
            userSelectedWeather = try JSONDecoder().decode(Weather.self, from: data)
        } catch {
            print(error.localizedDescription)
            userSelectedWeather = .defaultWeather
        }
    }

    func saveSource(_ weather: Weather) {
        do {
            userSelectedWeather = weather
            let data = try JSONEncoder().encode(userSelectedWeather)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}


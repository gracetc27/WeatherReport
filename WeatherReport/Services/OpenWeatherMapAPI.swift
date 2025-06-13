//
//  OpenWeatherMapAPI.swift
//  WeatherReport
//
//  Created by Grace couch on 16/05/2025.
//

import Foundation

class OpenWeatherMapAPI: WeatherServiceProtocol {
    static let apiKey: String = {
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: "plist")!
        let dict = NSDictionary(contentsOf: url)!
        let newsAPIKey = dict["OpenWeatherMapKey"] as! String
        return newsAPIKey
    }()


    func getCoordinates(searchTerm: String) async throws(APIError) -> [APICoordinate] {
        let coordConverterURLString = "https://api.openweathermap.org/geo/1.0/direct?q=\(searchTerm)&appid=\(Self.apiKey)"
        guard let url = URL(string: coordConverterURLString) else { throw .invalidURL }
        let request = URLRequest(url: url)

        let (data, _): (Data, URLResponse)

        do {
            (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw .noData
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let coordinates = try decoder.decode([APICoordinate].self, from: data)
            return coordinates
        } catch {
            throw .decodingFailed
        }
    }

    func getWeather(lon: Double, lat: Double) async throws(APIError) -> APIWeather {
        let weatherURLString = "https://api.openweathermap.org/data/2.5/weather?lat=\(String(lat))&lon=\(String(lon))&appid=\(Self.apiKey)&units=metric"

        guard let url = URL(string: weatherURLString) else { throw .invalidURL }
        let request = URLRequest(url: url)

        let (data, _): (Data, URLResponse)

        do {
            (data, _) = try await URLSession.shared.data(for: request)
        } catch {
            throw .noData
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weather = try decoder.decode(APIWeather.self, from: data)
            return weather
        } catch {
            throw .decodingFailed
        }
    }

    func getWeatherIconURL(iconString: String) -> URL {
        let iconURLString = "https://openweathermap.org/img/wn/\(iconString)@2x.png"
        return URL(string: iconURLString)!
    }
}

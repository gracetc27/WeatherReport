//
//  OpenWeatherMapAPI.swift
//  WeatherReport
//
//  Created by Grace couch on 16/05/2025.
//

import Foundation

class OpenWeatherMapAPI {
    static let apiKey: String = {
        let url = Bundle.main.url(forResource: "APIKeys", withExtension: "plist")!
        let dict = NSDictionary(contentsOf: url)!
        let newsAPIKey = dict["OpenWeatherMapKey"] as! String
        return newsAPIKey
    }()
    let weatherURLString = "https://api.openweathermap.org/data/2.5/weather?lat=???&lon=???&appid=\(apiKey)"

    let coordConverterURLString = "http://api.openweathermap.org/geo/1.0/direct?q=CITYNAMEHERE&appid=\(apiKey)"

    let iconURLString = "https://openweathermap.org/img/wn/ICONNUMBERHERE@2x.png"



    func getCoordinates() async throws(APIError) -> [APICoordinate] {
        guard let url = URL(string: coordConverterURLString) else { throw .invalidURL }
        var request = URLRequest(url: url)
        request.addValue(Self.apiKey, forHTTPHeaderField: "X-Api-Key")

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

    func getWeather() async throws(APIError) -> APIWeather {
        guard let url = URL(string: coordConverterURLString) else { throw .invalidURL }
        var request = URLRequest(url: url)
        request.addValue(Self.apiKey, forHTTPHeaderField: "X-Api-Key")

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
}

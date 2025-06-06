//
//  WeatherServiceProtocol.swift
//  WeatherReport
//
//  Created by Grace couch on 06/06/2025.
//

import Foundation


protocol WeatherServiceProtocol {
    func getCoordinates(searchTerm: String) async throws(APIError) -> [APICoordinate]
    func getWeather(lon: Double, lat: Double) async throws(APIError) -> APIWeather
    func getWeatherIconURL(iconString: String) -> URL 
}

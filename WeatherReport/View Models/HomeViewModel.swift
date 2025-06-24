//
//  HomeViewModel.swift
//  WeatherReport
//
//  Created by Grace couch on 30/05/2025.
//

import Foundation

@Observable
class HomeViewModel {
    private let placeManager: PlaceManagerProtocol
    private let service: WeatherServiceProtocol
    var recentPlace: Coordinate?
    var recentWeather: Weather?
    var recentPlaceError: SaveLoadError?
    var weatherError: APIError?
    var isShowingWeatherError: Bool = false
    var isShowingPlaceError: Bool = false
    var iconUrl: URL? {
        if let recentWeather {
          return service.getWeatherIconURL(iconString: recentWeather.weather[0].icon)
        } else {
            return nil
        }
    }

    init(placeManager: PlaceManagerProtocol, service: WeatherServiceProtocol) {
        self.placeManager = placeManager
        self.service = service
    }

    func loadRecentPlace() async {
        do throws(SaveLoadError){
            try await recentPlace = placeManager.loadSavedPlace()
        } catch {
            self.recentPlaceError = error
            self.isShowingPlaceError = true
        }
    }

    func getWeatherForRecentPlace() async {
        if let recentPlace {
            do throws(APIError) {
                let apiWeather = try await service.getWeather(lon: recentPlace.lon, lat: recentPlace.lat)
                self.recentWeather = Weather(
                    coord: apiWeather.coord,
                    weather: apiWeather.weather,
                    main: MainWeather(
                        temp: apiWeather.main.temp,
                        feelsLike: apiWeather.main.feelsLike,
                        tempMin: apiWeather.main.tempMin,
                        tempMax: apiWeather.main.tempMax,
                        pressure: apiWeather.main.pressure,
                        humidity: apiWeather.main.humidity),
                    wind: Wind(
                        speed: apiWeather.wind.speed,
                        deg: apiWeather.wind.deg,
                        gust: apiWeather.wind.gust),
                    clouds: apiWeather.clouds,
                    rain: Rain(perHour: apiWeather.rain?.perHour))
            } catch {
                self.weatherError = error
                self.isShowingWeatherError = true
            }
        }
    }
}

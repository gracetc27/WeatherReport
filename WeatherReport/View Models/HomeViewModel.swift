//
//  HomeViewModel.swift
//  WeatherReport
//
//  Created by Grace couch on 30/05/2025.
//

import Foundation

@Observable
class HomeViewModel {
    private let placeManager: PlaceManager
    private let service = OpenWeatherMapAPI()
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

    init(placeManager: PlaceManager) {
        self.placeManager = placeManager
    }

    func loadRecentPlace() async {
        do throws(SaveLoadError){
            try await placeManager.loadSavedPlace()
            recentPlace = placeManager.recentSelectedPlace
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
                    main: apiWeather.main,
                    wind: apiWeather.wind,
                    clouds: apiWeather.clouds,
                    rain: apiWeather.rain)
            } catch {
                self.weatherError = error
                self.isShowingWeatherError = true
            }
        }
    }
}

//
//  SearchPlacesViewModel.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//

import Foundation

@Observable
class SearchPlacesViewModel {
    private let service = OpenWeatherMapAPI()
    private let placeManager: PlaceManager
    var searchText = ""
    var isSearching = false
    var weatherError: APIError?
    var placeError: APIError?
    var saveError: SaveLoadError?
    var isShowingWeatherError: Bool = false
    var isShowingPlaceError: Bool = false
    var isShowingSaveError: Bool = false
    var coordinates: [Coordinate] = []
    var weatherSheetIsActive = false
    var weather: Weather = .defaultWeather
    var place: Coordinate = .defaultPlace

    init(placeManager: PlaceManager) {
        self.placeManager = placeManager
    }

    var searchCoordTask: Task<Void, Never>?

    var searchWeatherTask: Task<Void, Never>?

    func searchPlaces() {
        searchCoordTask?.cancel()
        searchCoordTask = Task {
            isSearching = true
            defer { isSearching = false }

            do throws(APIError) {
                coordinates = try await service.getCoordinates(searchTerm: self.searchText).map { apiCoordinate in
                    Coordinate(
                        id: UUID(),
                        name: apiCoordinate.name,
                        lat: apiCoordinate.lat,
                        lon: apiCoordinate.lon,
                        country: apiCoordinate.country,
                        state: apiCoordinate.state)
                }
                self.place = coordinates[0]
            } catch {
                self.placeError = error
                self.isShowingPlaceError = true
            }
        }
    }

    func saveRecentPlace() {
        do throws(SaveLoadError) {
            try placeManager.savePlace(self.place)
        } catch {
            self.saveError = error
            self.isShowingSaveError = true
        }
    }

    func getWeatherForCoord() {
        searchWeatherTask?.cancel()
        searchWeatherTask = Task {
            do throws(APIError) {
                let apiWeather = try await service.getWeather(lon: place.lon, lat: place.lat)
                self.weather = Weather(
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

    func getIconURL() -> URL {
        service.getWeatherIconURL(iconString: self.weather.weather[0].icon)
    }
}

//
//  SearchPlacesViewModel.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//

import Foundation

@Observable
class SearchPlacesViewModel {
    private let service: WeatherServiceProtocol
    private let placeManager: PlaceManagerProtocol
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
    var weather: Weather?
    var place: Coordinate?
    var iconUrl: URL? {
        if let weather {
          return service.getWeatherIconURL(iconString: weather.weather[0].icon)
        } else {
            return nil
        }
    }

    init(placeManager: PlaceManagerProtocol, service: WeatherServiceProtocol) {
        self.placeManager = placeManager
        self.service = service
    }

    func searchPlaces() async {
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

    func saveRecentPlace() {
        if let place {
            do throws(SaveLoadError) {
                try placeManager.savePlace(place)
            } catch {
                self.saveError = error
                self.isShowingSaveError = true
            }
        }
    }

    func getWeatherForCoord() async {
        if let place {
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
}


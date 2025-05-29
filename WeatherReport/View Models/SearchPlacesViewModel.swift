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
    var error: APIError?
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
                        localNames: apiCoordinate.localNames,
                        lat: apiCoordinate.lat,
                        lon: apiCoordinate.lon,
                        country: apiCoordinate.country,
                        state: apiCoordinate.state)
                }
            } catch {
                self.error = error
            }
        }
    }

    func saveRecentPlace(_ place: Coordinate) {
        self.place = place
        placeManager.savePlace(place)
    }

    func getWeatherForCoord() {
        searchWeatherTask?.cancel()
        searchWeatherTask = Task {
            do throws(APIError) {
                let apiWeather = try await service.getWeather(lon: place.lon, lat: place.lat)
                self.weather = Weather(
                    coord: apiWeather.coord,
                    weather: apiWeather.weather,
                    main: apiWeather.main,
                    wind: apiWeather.wind,
                    clouds: apiWeather.clouds,
                    rain: apiWeather.rain)
            } catch {
                self.error = error
                print(error)
            }
        }
    }
}

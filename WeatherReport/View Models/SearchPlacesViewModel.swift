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
    var searchText = ""
    var isSearching = false
    var error: APIError?
    var coordinates: [Coordinate] = []
    var selectedCoord: Coord?

    var searchTask: Task<Void, Never>?

    func searchPlaces() {
        searchTask?.cancel()
        searchTask = Task {
            isSearching = true
            defer { isSearching = false }

            do throws(APIError) {
                coordinates = try await service.getCoordinates(searchTerm: self.searchText).map { apiCoordinate in
                    Coordinate(id: UUID(), name: apiCoordinate.name, localNames: apiCoordinate.localNames, lat: apiCoordinate.lat, lon: apiCoordinate.lon, country: apiCoordinate.country, state: apiCoordinate.state, isSelected: false)
                }
                
            } catch {
                self.error = error
            }
        }
    }
}

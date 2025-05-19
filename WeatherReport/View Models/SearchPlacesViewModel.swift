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

    func searchPlaces() async {
        do throws(APIError) {
            try await service.getCoordinates(searchTerm: self.searchText)
        } catch {
            self.error = error
        }
    }
}

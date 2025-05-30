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
    var recentPlace: Coordinate = .defaultPlace
    var recentWeather: Weather = .defaultWeather

    init(placeManager: PlaceManager) {
        self.placeManager = placeManager
    }

    func loadRecentPlace() async {
        await placeManager.loadSavedPlace()
        recentPlace = placeManager.recentSelectedPlace
    }
}

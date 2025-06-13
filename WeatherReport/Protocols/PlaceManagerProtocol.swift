//
//  PlaceManagerProtocol.swift
//  WeatherReport
//
//  Created by Grace couch on 13/06/2025.
//

import Foundation


protocol PlaceManagerProtocol {
    var recentSelectedPlace: Coordinate? { get set }
    func loadSavedPlace() async throws(SaveLoadError)
    func savePlace(_ place: Coordinate) throws(SaveLoadError)
}

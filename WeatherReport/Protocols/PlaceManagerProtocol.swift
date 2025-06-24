//
//  PlaceManagerProtocol.swift
//  WeatherReport
//
//  Created by Grace couch on 13/06/2025.
//

import Foundation


protocol PlaceManagerProtocol {
    func loadSavedPlace() async throws(SaveLoadError) -> Coordinate
    func savePlace(_ place: Coordinate) throws(SaveLoadError)
}

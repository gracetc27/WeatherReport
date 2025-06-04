//
//  SaveLoadError.swift
//  WeatherReport
//
//  Created by Grace couch on 04/06/2025.
//
import SwiftUI

enum SaveLoadError: LocalizedError {
    case savingFailed
    case loadingFailed
    var errorDescription: String? {
        switch self {
        case .savingFailed:
            "Saving failed"
        case .loadingFailed:
            "Loading failed"
        }
    }
}

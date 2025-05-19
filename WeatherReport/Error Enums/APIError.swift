//
//  APIError.swift
//  WeatherReport
//
//  Created by Grace couch on 19/05/2025.
//
import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case noData
    case decodingFailed
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data available"
        case .decodingFailed:
            return "Decoding failed"
        }
    }
}

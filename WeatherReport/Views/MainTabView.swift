//
//  WeatherReportTabView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct MainTabView: View {
    let placeManager: PlaceManager
    let service: WeatherServiceProtocol
    var body: some View {
        TabView {
            HomeView(placeManager: placeManager, service: service)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchPlacesView(placeManager: placeManager, service: service)
                .tabItem {
                    Label("Weather Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView(placeManager: PlaceManager(), service: MockWeatherService())
}

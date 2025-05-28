//
//  WeatherReportTabView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct MainTabView: View {
    let placeManager: PlaceManager
    var body: some View {
        TabView {
            HomeView(placeManager: placeManager)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchPlacesView(placeManager: placeManager)
                .tabItem {
                    Label("Weather Search", systemImage: "magnifyingglass")
                }
        }
    }
}

#Preview {
    MainTabView(placeManager: PlaceManager())
}

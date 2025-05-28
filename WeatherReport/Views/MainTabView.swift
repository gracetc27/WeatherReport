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
                    Label("Headlines", systemImage: "list.dash")
                }
            
            SearchPlacesView(placeManager: placeManager)
                .tabItem {
                    Label("Sources", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainTabView(placeManager: PlaceManager())
}

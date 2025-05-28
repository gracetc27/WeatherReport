//
//  WeatherReportTabView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct MainTabView: View {
    let weatherManager: WeatherManager
    var body: some View {
        TabView {
            HomeView(weatherManager: weatherManager)
                .tabItem {
                    Label("Headlines", systemImage: "list.dash")
                }
            
            SearchPlacesView(weatherManager: weatherManager)
                .tabItem {
                    Label("Sources", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainTabView(weatherManager: WeatherManager())
}

//
//  WeatherReportTabView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Headlines", systemImage: "list.dash")
                }
            
            SearchPlacesView()
                .tabItem {
                    Label("Sources", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainTabView()
}

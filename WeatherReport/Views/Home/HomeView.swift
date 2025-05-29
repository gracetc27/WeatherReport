//
//  HomeView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct HomeView: View {
    let placeManager: PlaceManager
    var body: some View {
        Text(placeManager.recentSelectedPlace.name)
            .task {
                await placeManager.loadSavedPlace()
            }
    }
}

#Preview {
    HomeView(placeManager: PlaceManager())
}

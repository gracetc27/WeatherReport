//
//  HomeView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    init(placeManager: PlaceManager) {
        self._viewModel = State(initialValue: HomeViewModel(placeManager: placeManager))
    }
    var body: some View {
        Group {
            if let recentPlace = viewModel.recentPlace {
                VStack {
                    PlaceTitleView(place: recentPlace)
                    RecentPlaceWeatherView(viewModel: viewModel)
                }
            } else {
                EmptyRecentWeatherView()
            }
        }
        .task {
            await viewModel.loadRecentPlace()
            await viewModel.getWeatherForRecentPlace()
        }
    }
}

#Preview {
    HomeView(placeManager: PlaceManager())
}

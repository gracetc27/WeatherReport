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
        NavigationStack {
            VStack(alignment: .leading) {
                Spacer()
                Text("Recently Searched City")
                    .padding()
                    .font(.title2.bold())
                Spacer()
                if let recentPlace = viewModel.recentPlace,
                   let recentWeather = viewModel.recentWeather,
                   let iconUrl = viewModel.iconUrl {
                    VStack {
                        PlaceTitleView(place: recentPlace)
                        RecentPlaceWeatherView(weather: recentWeather, url: iconUrl)
                    }
                } else {
                    EmptyRecentWeatherView()
                }
                Spacer()
            }
            .alert(isPresented: $viewModel.isShowingPlaceError, error: viewModel.recentPlaceError, actions: {})
            .alert(isPresented: $viewModel.isShowingWeatherError, error: viewModel.weatherError, actions: {})
            .navigationTitle("Weather report")
            .task {
                await viewModel.loadRecentPlace()
                await viewModel.getWeatherForRecentPlace()
            }
        }
    }
}


#Preview {
    HomeView(placeManager: PlaceManager())
}

//
//  RecentPlaceWeatherView.swift
//  WeatherReport
//
//  Created by Grace couch on 30/05/2025.
//

import SwiftUI

struct RecentPlaceWeatherView: View {
    let viewModel: HomeViewModel
    var body: some View {
        VStack {
            GeneralWeatherPanel(weather: viewModel.recentWeather, url: viewModel.getRecentIconURL())
            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    TempPanel(main: viewModel.recentWeather.main)
                    WindPanel(wind: viewModel.recentWeather.wind)
                }
                .padding()
            }
        }
    }
}

#Preview {
    RecentPlaceWeatherView(viewModel: HomeViewModel(placeManager: PlaceManager()))
}

//
//  WeatherDetailView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct WeatherDetailView: View {
    @Environment(\.dismiss) var dismiss
    let viewModel: SearchPlacesViewModel
    var body: some View {
        NavigationStack {
            VStack {
                PlaceTitleView(place: viewModel.place)
                GeneralWeatherPanel(weather: viewModel.weather, url: viewModel.getIconURL())
                TempPanel(main: viewModel.weather.main)
                WindPanel(wind: viewModel.weather.wind)
            }
            .toolbar {
                Button("Done") {
                    dismiss()
                }
            }
            Spacer()
        }
    }
}

#Preview {
    WeatherDetailView(viewModel: SearchPlacesViewModel(placeManager: PlaceManager()))
}

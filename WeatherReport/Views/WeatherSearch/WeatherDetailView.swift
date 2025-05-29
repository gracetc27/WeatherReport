//
//  WeatherDetailView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct WeatherDetailView: View {
    let viewModel: SearchPlacesViewModel
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.place.name)
                    .font(.largeTitle.bold())
                Text("(\(viewModel.place.country))")
                    .font(.title)
            }
            Spacer()
            TempPanel(main: viewModel.weather.main)
            WindPanel(wind: viewModel.weather.wind)
        }
        Spacer()
    }
}

#Preview {
    WeatherDetailView(viewModel: SearchPlacesViewModel(placeManager: PlaceManager()))
}

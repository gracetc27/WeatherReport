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
            Text(String(viewModel.weather.main.temp))
        }
    }
}

#Preview {
    WeatherDetailView(viewModel: SearchPlacesViewModel(placeManager: PlaceManager()))
}

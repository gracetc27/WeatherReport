//
//  GeneralWeatherPanel.swift
//  WeatherReport
//
//  Created by Grace couch on 29/05/2025.
//

import SwiftUI

struct GeneralWeatherPanel: View {
    let viewModel: SearchPlacesViewModel
    var body: some View {
        HStack {
            WeatherIconView(url: viewModel.getIconURL())
                .frame(width: 100, height: 100)
            Text(viewModel.weather.weather[0].description.capitalized)
        }
    }
}

#Preview {
    GeneralWeatherPanel(viewModel: SearchPlacesViewModel(placeManager: PlaceManager()))
}

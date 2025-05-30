//
//  GeneralWeatherPanel.swift
//  WeatherReport
//
//  Created by Grace couch on 29/05/2025.
//

import SwiftUI

struct GeneralWeatherPanel: View {
    let weather: Weather
    let url: URL
    var body: some View {
        HStack {
            WeatherIconView(url: url)
                .frame(width: 150, height: 150)
            Text(weather.weather[0].description.capitalized)
                .font(.title)
        }
    }
}

#Preview {
    GeneralWeatherPanel(weather: .defaultWeather, url: URL(string: "hsibx")!)
}

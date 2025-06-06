//
//  WeatherDetailView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct WeatherDetailView: View {
    @Environment(\.dismiss) var dismiss
    let place: Coordinate
    let weather: Weather
    let iconUrl: URL
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    PlaceTitleView(place: place)
                    GeneralWeatherPanel(weather: weather, url: iconUrl)
                    TempPanel(main: weather.main)
                    WindPanel(wind: weather.wind)
                    PrecipitationPanel(rain: weather.rain, clouds: weather.clouds)
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
}

#Preview {
    WeatherDetailView(place: .defaultPlace, weather: .defaultWeather, iconUrl: URL(string: "fake url")!)
}

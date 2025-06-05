//
//  RecentPlaceWeatherView.swift
//  WeatherReport
//
//  Created by Grace couch on 30/05/2025.
//

import SwiftUI

struct RecentPlaceWeatherView: View {
    let weather: Weather
    let url: URL
    var body: some View {
        VStack {
            GeneralWeatherPanel(weather: weather, url: url)
            ScrollView(.horizontal) {
                HStack(alignment: .top) {
                    Group {
                        TempPanel(main: weather.main)
                        WindPanel(wind: weather.wind)
                        PrecipitationPanel(rain: weather.rain, clouds: weather.clouds)
                    }
                    .containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    RecentPlaceWeatherView(weather: .defaultWeather, url: URL(string: "ubtv")!)
}

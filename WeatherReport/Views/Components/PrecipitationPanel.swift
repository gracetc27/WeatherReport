//
//  PrecipitationPanel.swift
//  WeatherReport
//
//  Created by Grace couch on 04/06/2025.
//

import SwiftUI

struct PrecipitationPanel: View {
    let rain: Rain?
    let clouds: APIClouds
    var body: some View {
        VStack(alignment: .leading) {
            Text("Precipitation")
                .font(.title2.bold())
                .padding(.vertical)
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Rain per hour:")
                    Text("Cloud cover:")
                }
                .bold()
                Spacer()
                VStack(alignment: .trailing, spacing: 20) {
                    Text("\(rain?.perHour ?? 0)mm")
                    Text("\(clouds.all)%")
                }
            }
        }
    }
}

#Preview {
    PrecipitationPanel(rain: Weather.defaultWeather.rain, clouds: Weather.defaultWeather.clouds)
}

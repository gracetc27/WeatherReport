//
//  WindPanel.swift
//  WeatherReport
//
//  Created by Grace couch on 29/05/2025.
//

import SwiftUI

struct WindPanel: View {
    let wind: Wind
    var body: some View {
        Text("Wind")
            .font(.title2.bold())
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Wind speed:")
                Text("Wind direction:")
                Text("Gust:")
            }
            .bold()
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text("\(wind.speed ?? 0) m/s")
                Text("\(wind.deg ?? 0)°")
                Text("\(wind.gust ?? 0) m/s")
            }
        }
        .padding(4)
    }
}

#Preview {
    WindPanel(wind: Weather.defaultWeather.wind)
}

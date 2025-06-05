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
        VStack(alignment: .leading) {
            Text("Wind")
                .font(.title2.bold())
                .padding(.vertical)
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Wind speed:")
                    Text("Wind direction:")
                    Text("Gust:")
                }
                .bold()
                Spacer()
                VStack(alignment: .trailing, spacing: 20) {
                    Text("\(wind.speed ?? 0) m/s")
                    Text("\(wind.deg ?? 0)°")
                    Text("\(wind.gust ?? 0) m/s")
                }
            }
        }
    }
}

#Preview {
    WindPanel(wind: Weather.defaultWeather.wind)
}

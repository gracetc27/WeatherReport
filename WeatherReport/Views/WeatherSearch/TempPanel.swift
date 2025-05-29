//
//  TempPanel.swift
//  WeatherReport
//
//  Created by Grace couch on 29/05/2025.
//

import SwiftUI

struct TempPanel: View {
    let main: MainWeather
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Temperature:")
                Text("Feels like:")
                Text("Humity:")
                Text("Atmospheric pressure:")
            }
            .bold()
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text("\(main.temp ?? 0)°C")
                Text("\(main.feelsLike ?? 0)°C")
                Text("\(main.humidity ?? 0)%")
                Text("\(main.pressure ?? 0) hPa")

            }
        }
        .padding(4)
    }
}

#Preview {
    TempPanel(main: Weather.defaultWeather.main)
}

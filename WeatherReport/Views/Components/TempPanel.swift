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
        VStack(alignment: .leading) {
            Text("Main Weather")
                .font(.title2.bold())
                .padding(.vertical)
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Temperature:")
                    Text("Feels like:")
                    Text("Humity:")
                    Text("Atmospheric pressure:")
                }
                .bold()
                Spacer()
                VStack(alignment: .trailing, spacing: 20) {
                    tempText(main.tempMeasurement)
                    tempText(main.feelsLikeMeasurement)
                    Text("\(main.humidity ?? 0)%")
                    Text("\(main.pressure ?? 0) hPa")

                }
            }
        }
    }

    @ViewBuilder
    func tempText(_ temp: Measurement<UnitTemperature>?) -> some View {
        if let temp {
           Text(temp, format: .measurement(width: .abbreviated, usage: .weather))
        }
    }
}


#Preview {
    TempPanel(main: Weather.defaultWeather.main)
}

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
                    Text("\(main.temp ?? 0)°C")
                    Text("\(main.feelsLike ?? 0)°C")
                    Text("\(main.humidity ?? 0)%")
                    Text("\(main.pressure ?? 0) hPa")
                    
                }
            }
        }
        .frame(width: screenWidth * 0.9)
    }
}

#Preview {
    TempPanel(main: Weather.defaultWeather.main)
}

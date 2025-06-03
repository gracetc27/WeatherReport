//
//  EmptyRecentWeatherView.swift
//  WeatherReport
//
//  Created by Grace couch on 03/06/2025.
//

import SwiftUI

struct EmptyRecentWeatherView: View {
    var body: some View {
        VStack {
            Text("No recent weather available...")
                .multilineTextAlignment(.center)
                .font(.title3.bold())
                .padding()
            Text("Search a city to see the weather!")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    EmptyRecentWeatherView()
}

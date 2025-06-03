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
                .font(.largeTitle.bold())
                .padding()
            Text("Search a city to see the weather!")
        }
    }
}

#Preview {
    EmptyRecentWeatherView()
}

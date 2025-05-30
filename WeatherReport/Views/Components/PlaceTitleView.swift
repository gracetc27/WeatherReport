//
//  PlaceTitleView.swift
//  WeatherReport
//
//  Created by Grace couch on 30/05/2025.
//

import SwiftUI

struct PlaceTitleView: View {
    let place: Coordinate
    var body: some View {
        HStack {
            Text(place.name)
                .font(.largeTitle.bold())
            Text("(\(place.country))")
                .font(.title)
        }
    }
}

#Preview {
    PlaceTitleView(place: .defaultPlace)
}

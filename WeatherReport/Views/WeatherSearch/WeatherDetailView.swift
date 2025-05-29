//
//  WeatherDetailView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct WeatherDetailView: View {
    let viewModel: SearchPlacesViewModel
    var body: some View {
        VStack {
            Text(viewModel.place.name)
                .font(.largeTitle.bold())
        }
    }
}

#Preview {
    WeatherDetailView(viewModel: SearchPlacesViewModel(placeManager: PlaceManager()))
}

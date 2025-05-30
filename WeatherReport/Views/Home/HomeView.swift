//
//  HomeView.swift
//  WeatherReport
//
//  Created by Grace couch on 28/05/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    init(placeManager: PlaceManager) {
        self._viewModel = State(initialValue: HomeViewModel(placeManager: placeManager))
    }
    var body: some View {
        VStack {
            Text(viewModel.recentPlace.name)
        }
        .task {
            await viewModel.loadRecentPlace()
        }
    }
}

#Preview {
    HomeView(placeManager: PlaceManager())
}

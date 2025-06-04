//
//  SearchPlacesView.swift
//  WeatherReport
//
//  Created by Grace couch on 16/05/2025.
//

import SwiftUI

struct SearchPlacesView: View {
    @State private var viewModel: SearchPlacesViewModel
    init(placeManager: PlaceManager) {
        self._viewModel = State(initialValue: SearchPlacesViewModel(placeManager: placeManager))
    }

    var body: some View {
        NavigationStack {
            if viewModel.isSearching {
                Text("Searching for \(viewModel.searchText)")
            } else {
                List {
                    ForEach(viewModel.coordinates) { place in
                        Button {
                            viewModel.saveRecentPlace()
                            viewModel.getWeatherForCoord()
                            viewModel.weatherSheetIsActive = true
                        } label: {
                            Text(place.name)
                        }
                    }
                }
                .sheet(isPresented: $viewModel.weatherSheetIsActive) {
                    WeatherDetailView(viewModel: viewModel)
                        .padding(.vertical)
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("City search")
                .onSubmit(of: .search) {
                    viewModel.searchPlaces()
                }
            }
        }
    }
}

#Preview {
    SearchPlacesView(placeManager: PlaceManager())
}

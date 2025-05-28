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
                            viewModel.weatherSheetIsActive = true
                            viewModel.saveRecentPlace(place)
                        } label: {
                            Text(place.name)
                        }

                    }
                }
                .searchable(text: $viewModel.searchText)
                .navigationTitle("Area search")
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

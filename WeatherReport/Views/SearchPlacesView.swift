//
//  SearchPlacesView.swift
//  WeatherReport
//
//  Created by Grace couch on 16/05/2025.
//

import SwiftUI

struct SearchPlacesView: View {
    @State private var viewModel: SearchPlacesViewModel
    init(weatherManager: WeatherManager) {
        self._viewModel = State(initialValue: SearchPlacesViewModel(weatherManager: weatherManager))
    }

    var body: some View {
        NavigationStack {
            if viewModel.isSearching {
                Text("Searching for \(viewModel.searchText)")
            } else {
                List {
                    ForEach(viewModel.coordinates) { place in
                        NavigationLink {
                            WeatherDetailView()
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
    SearchPlacesView(weatherManager: WeatherManager())
}
